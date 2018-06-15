# frozen_string_literal: true

require 'rails_helper'

feature 'Usuário visita a pagina inicial' do
  scenario 'com sucesso' do
    visit root_path

    expect(page).to have_css('h1', text: 'Coltivazione')
  end

  scenario 'Usuarios logados não veem link de login' do
    user = create(:user)

    sign_in user

    visit root_path

    expect(page).not_to have_content('Log in')
  end
end
