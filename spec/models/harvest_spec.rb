# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Harvest, type: :model do
  let(:user) { create(:user) }
  let(:farm) { create(:farm, user: user) }
  let(:seed) { 'Soja' }
  let(:initial_date) { 3.days.from_now }
  let(:end_date_prediction) { 2.months.from_now }
  let(:employee) { 'Julian' }

  subject do
    build(:harvest, farm: farm, seed: seed, initial_date: initial_date,
                    end_date_prediction: end_date_prediction,
                    employee: employee)
  end

  it { should belong_to(:user) }
  it { should belong_to(:farm) }

  describe 'validações' do
    it { should validate_presence_of(:seed) }
    it { should validate_presence_of(:initial_date) }
    it { should validate_presence_of(:end_date_prediction) }
    it { should validate_presence_of(:employee) }

    it 'deve ser valido com atributos validos' do
      expect(subject).to be_valid
    end

    it 'não deve haver duas safras ativas por fazenda' do
      create(:harvest, farm: farm, user: user)

      expect(subject).not_to be_valid
      expect(subject.errors).to be_added(:seed, :has_other_active_farm)
    end
  end
end
