# frozen_string_literal: true

require 'rails_helper'

feature 'Usuario adiciona acontecimento na linha do tempo da safra' do
  let(:user) { create(:user) }
  let!(:farm) { create(:farm, user: user) }
  let!(:harvest) { create(:harvest, farm: farm, user: user, state: 'active') }

  scenario 'com sucesso' do
    sign_in user

    visit root_path
    click_on 'Fazendas'
    click_on farm.name
    click_on 'Safra de Soja #1'
    click_on 'Adicionar acontecimento'

    fill_in 'Acontecimento', with: 'Teve um bagaço muito loco'
    fill_in 'Data', with: Time.zone.yesterday
    click_on 'Criar Acontecimento'

    expect(page).to have_css('dt', text: 'Linha do Tempo')
    expect(page).to have_css('th', text: 'Data')
    expect(page).to have_css('th', text: 'Acontecimento')
    expect(page).to have_css('th', text: I18n.l(Time.zone.yesterday))
    expect(page).to have_css('td', text: 'Teve um bagaço muito loco')
  end
end
