# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:harvest) }

  describe 'validacoes' do
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:date) }
  end
end
