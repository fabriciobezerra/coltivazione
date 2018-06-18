# frozen_string_literal: true

require 'rails_helper'

feature 'Usuario pode ver a lista de safras' do
  let(:user) { create(:user) }

  scenario 'por fazenda' do
    farm = create(:farm, user: user)
    create_list(:harvest, 5, farm: farm, user: user, state: 'ended')

    sign_in user

    visit root_path
    click_on 'Fazendas'
    click_on farm.name
    click_on 'Todas as safras'

    expect(page).to have_css('h1', text: 'Safra de Soja #1')
    expect(page).to have_css('h1', text: 'Safra de Soja #2')
    expect(page).to have_css('h1', text: 'Safra de Soja #3')
    expect(page).to have_css('h1', text: 'Safra de Soja #4')
    expect(page).to have_css('h1', text: 'Safra de Soja #5')
  end
end
