# frozen_string_literal: true

require 'rails_helper'

feature 'Usuario vê a página da fazendo com uma safra' do
  let(:user) { create(:user) }
  let(:farm) { create(:farm, user: user) }
  let!(:harvest) do
    create(:harvest, farm: farm, user: user, seed: 'Soja', state: 'active')
  end

  scenario 'a safra que está acontecendo' do
    sign_in user

    visit farm_path(farm)

    expect(page).to have_css('h1', text: 'Safra de Soja #1')
    expect(page).to have_css('dt', text: 'Semente')
    expect(page).to have_css('dd', text: harvest.seed)
    expect(page).to have_css('dt', text: 'Data do Plantio')
    expect(page).to have_css('dd', text: I18n.l(harvest.initial_date))
    expect(page).to have_css('dt', text: 'Data de Previsão de Colheita')
    expect(page).to have_css('dd', text: I18n.l(harvest.end_date_prediction))
    expect(page).to have_css('dt', text: 'Funcionario Responsavel')
    expect(page).to have_css('dd', text: harvest.employee)
  end

  scenario 'somente se a safra for ativa' do
    harvest.update(final_notes: 'Cancelled', total_collected: 50)
    harvest.cancelled!

    sign_in user

    visit farm_path(farm)

    expect(page).not_to have_css('h1', text: 'Safra de Soja #1')
  end
end
