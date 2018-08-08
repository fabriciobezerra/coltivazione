# frozen_string_literal: true

require 'rails_helper'

feature 'Usuario consegue ver a lista de fazendas' do
  let(:user) { create(:user) }

  scenario 'Com sucesso' do
    farms = create_list(:farm, 5, user: user)

    sign_in user

    visit root_path
    click_on 'Fazendas'

    farms.each do |farm|
      expect(page).to have_css('h2', text: farm.name)
      expect(page).to have_css('dt', text: 'Endereço')
      expect(page).to have_css('dd', text: farm.address)
      expect(page).to have_css('dt', text: 'Tamanho (em km²)')
      expect(page).to have_css('dd', text: farm.size)
      expect(page).to have_css('dt', text: 'Latitude')
      expect(page).to have_css('dd', text: farm.latitude)
      expect(page).to have_css('dt', text: 'Longitude')
      expect(page).to have_css('dd', text: farm.longitude)
    end
  end
end
