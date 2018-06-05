# frozen_string_literal: true

require 'rails_helper'

feature 'Usuario registra uma safra' do
  let(:farm) { create(:farm) }

  scenario 'com sucesso' do
    visit farm_path(farm)
    click_on 'Cadastrar safra'

    fill_in 'Semente', with: 'Soja'
    fill_in 'Data do Plantio', with: Time.zone.today
    fill_in 'Data de Previsão de Colheita', with: Time.zone.today
    fill_in 'Funcionario Responsavel', with: 'José'
    click_on 'Criar Safra'

    expect(page).to have_css('h1', text: 'Safra de Soja #1')
    expect(page).to have_css('dt', text: 'Semente')
    expect(page).to have_css('dd', text: 'Soja')
    expect(page).to have_css('dt', text: 'Data do Plantio')
    expect(page).to have_css('dd', text: I18n.l(Time.zone.today))
    expect(page).to have_css('dt', text: 'Data de Previsão de Colheita')
    expect(page).to have_css('dd', text: I18n.l(Time.zone.today))
    expect(page).to have_css('dt', text: 'Funcionario Responsavel')
    expect(page).to have_css('dd', text: 'José')
  end

  scenario 'deve falhar se não preencher os campos obrigatórios' do
    visit farm_path(farm)
    click_on 'Cadastrar safra'

    fill_in 'Semente', with: ''
    fill_in 'Data do Plantio', with: ''
    fill_in 'Data de Previsão de Colheita', with: ''
    fill_in 'Funcionario Responsavel', with: ''
    click_on 'Criar Safra'

    expect(page).to have_content('Semente não pode ficar em branco')
    expect(page).to have_content('Data do Plantio não pode ficar em branco')
    expect(page)
      .to have_content('Data de Previsão de Colheita não pode ficar em branco')
    expect(page)
      .to have_content('Funcionario Responsavel não pode ficar em branco')
  end
end
