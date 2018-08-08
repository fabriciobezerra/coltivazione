# frozen_string_literal: true

require 'rails_helper'

feature 'Usuário registra uma organização' do
  let(:user) { create(:user) }

  scenario 'com sucesso' do
    sign_in user

    visit root_path
    click_on "Configurar minha organização"

    fill_in "Nome", with: 'Monkey Bussiness'
    fill_in 'Endereço', with: 'Rod. Bandeirantes'
    click_on 'Salvar organização'

    expect(page).to have_css('h1', text: 'Monkey Business')
    expect(page).to have_css('dt', text: 'Endereço')
    expect(page).to have_css('dd', text: 'Rod. Bandeirantes')
  end
end
