# frozen_string_literal: true

require 'rails_helper'

feature 'Usuario registra uma safra' do
  let(:farm) { create(:farm, user: user) }
  let(:user) { create(:user) }

  scenario 'com sucesso' do
    sign_in user

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
    sign_in user

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

  context 'usuario deve estar logado' do
    scenario 'para ver uma safra' do
      harvest = create(:harvest, farm: farm)

      visit farm_harvest_path(farm, harvest)

      expect(current_path).to eq new_user_session_path
    end

    context 'para ver uma safra' do
      scenario 'com sucesso' do
        harvest = create(:harvest)

        visit farm_harvest_path(harvest.farm, harvest)

        expect(current_path).to eq new_user_session_path
      end

      scenario 'deve ser dono da fazenda' do
        owner = create(:user)
        user = create(:user)
        farm = create(:farm, user: owner)
        harvest = create(:harvest, farm: farm)

        sign_in user

        visit farm_harvest_path(farm, harvest)

        expect(current_path).to eq root_path
        expect(page).to have_css(
          '.alert.alert-danger',
          text: 'Permissão para ver a Safra recusada'
        )
      end
    end
  end
end
