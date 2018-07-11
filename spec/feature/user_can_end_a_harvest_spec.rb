# frozen_string_literal: true

require 'rails_helper'

feature 'Usuario pode encerrar safra' do
  let(:user) { create(:user) }
  let!(:farm) { create(:farm, user: user) }
  let!(:harvest) { create(:harvest, farm: farm, user: user, state: 'active') }

  scenario 'com sucesso' do
    sign_in user

    visit root_path
    click_on 'Fazendas'
    click_on farm.name
    click_on 'Encerrar safra'

    select 'Encerrada', from: 'Status'
    fill_in 'Total arrecadado (em ton)', with: '50'
    fill_in 'Notas finais', with: 'Encerrando a safra'
    click_on 'Encerrar'

    expect(page).to have_css('dd', text: 'Encerrada')
    expect(page).to have_css('dt', text: 'Total arrecadado (em ton)')
    expect(page).to have_css('dd', text: '50')
    expect(page).to have_css('dt', text: 'Notas finais')
    expect(page).to have_css('dd', text: 'Encerrando a safra')
  end

  scenario 'cancelando a safra' do
    sign_in user

    visit root_path
    click_on 'Fazendas'
    click_on farm.name
    click_on 'Encerrar safra'

    select 'Cancelada', from: 'Status'
    fill_in 'Total arrecadado (em ton)', with: '0'
    fill_in 'Notas finais', with: 'Geada acabou com tudo'
    click_on 'Encerrar'

    expect(page).to have_css('dd', text: 'Cancelada')
    expect(page).to have_css('dt', text: 'Total arrecadado (em ton)')
    expect(page).to have_css('dd', text: '0')
    expect(page).to have_css('dt', text: 'Notas finais')
    expect(page).to have_css('dd', text: 'Geada acabou com tudo')
  end
end
