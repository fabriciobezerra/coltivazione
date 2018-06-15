# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Farm, type: :model do
  let(:name) { 'Santiago' }
  let(:address) { 'Rodovia Km 21' }
  let(:size) { 400 }
  let(:latitude) { 32.54545 }
  let(:longitude) { 45.42435 }

  subject do
    build(:farm, name: name, address: address, size: size,
                 latitude: latitude, longitude: longitude)
  end

  it { should belong_to(:user) }
  it { should have_many(:harvests) }

  describe 'validações' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:size) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }

    it 'deve ser valido com atributos validos' do
      expect(subject).to be_valid
    end
  end
end
