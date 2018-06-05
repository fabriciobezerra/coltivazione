# frozen_string_literal: true

require 'rails_helper'

feature 'Usuário visita a pagina inicial' do
  scenario 'com sucesso' do
    visit root_path

    expect(page).to have_css('h1', text: 'Coltivazione')
  end
end
