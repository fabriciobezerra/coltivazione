# frozen_string_literal: true

require 'rails_helper'

feature 'Usuario registra uma fazenda' do
  let(:user) { create(:user) }

  scenario 'com sucesso' do
    sign_in user

    visit root_path
    click_on 'Cadastrar fazenda'

    fill_in 'Nome', with: 'Santiago'
    fill_in 'Endereço', with: 'Rodovia Bandeirantes, 662'
    fill_in 'Tamanho (em km²)', with: '420'
    fill_in 'Latitude', with: '32.91663'
    fill_in 'Longitude', with: '-96.919495'
    click_on 'Criar Fazenda'

    expect(page).to have_css('h1', text: 'Santiago')
    expect(page).to have_css('dt', text: 'Endereço')
    expect(page).to have_css('dd', text: 'Rodovia Bandeirantes, 662')
    expect(page).to have_css('dt', text: 'Tamanho (em km²)')
    expect(page).to have_css('dd', text: '420')
    expect(page).to have_css('dt', text: 'Latitude')
    expect(page).to have_css('dd', text: '32.91663')
    expect(page).to have_css('dt', text: 'Longitude')
    expect(page).to have_css('dd', text: '-96.919495')
  end

  scenario 'deve falhar se não preencher campos obrigatórios' do
    sign_in user

    visit root_path
    click_on 'Cadastrar fazenda'

    fill_in 'Nome', with: ''
    fill_in 'Endereço', with: ''
    fill_in 'Tamanho (em km²)', with: ''
    fill_in 'Latitude', with: ''
    fill_in 'Longitude', with: ''
    click_on 'Criar Fazenda'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Endereço não pode ficar em branco')
    expect(page).to have_content('Tamanho (em km²) não pode ficar em branco')
    expect(page).to have_content('Latitude não pode ficar em branco')
    expect(page).to have_content('Longitude não pode ficar em branco')
  end

  context 'usuario deve estar logado' do
    scenario 'para cadastrar uma fazenda' do
      visit root_path
      click_on 'Cadastrar fazenda'

      expect(current_path).to eq new_user_session_path
    end

    context 'para ver uma fazenda' do
      scenario 'com sucesso' do
        farm = create(:farm)

        visit farm_path(farm)

        expect(current_path).to eq new_user_session_path
      end

      scenario 'deve ser dono da fazenda' do
        owner = create(:user)
        user = create(:user)
        farm = create(:farm, user: owner)

        sign_in user

        visit farm_path(farm)

        expect(current_path).to eq root_path
        expect(page).to have_css(
          '.alert.alert-danger',
          text: 'Permissão para ver a fazenda recusada'
        )
      end
    end
  end
end
