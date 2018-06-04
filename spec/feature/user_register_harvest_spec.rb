require 'rails_helper'

feature 'Usuario registra uma safra' do
  let(:farm) { create(:farm) }

  scenario 'com sucesso' do
    visit farm_path(farm)
    click_on 'Cadastrar safra'

    fill_in 'Semente', with: 'Soja'
    fill_in 'Data de Inicio', with: Date.today
    fill_in 'Data de Previsão de Fim', with: Date.today
    fill_in 'Funcionario Responsavel', with: 'José'
    save_page
    click_on 'Criar Safra'

    expect(page).to have_content('h1', 'Safra de Soja #1')
  end
end

