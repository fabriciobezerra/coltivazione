# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HarvestDecorator do
  describe '#title' do
    let(:user) { create(:user) }
    let(:farm) { create(:farm, user: user) }
    let(:harvest) do
      create(:harvest, seed: 'Soja', farm: farm, user: user).decorate
    end

    subject { harvest.title }

    it 'retorna uma string' do
      expect(subject).to be_a(String)
    end

    it 'retorna o titulo da safra com numero' do
      expect(subject).to eq('Safra de Soja #1')
    end

    context 'retorna numeros maiores' do
      let(:harvests) do
        create_list(:harvest, 5, seed: 'Soja', farm: farm, user: user,
                                 state: 'ended')
      end
      let(:harvest) { harvests.last.decorate }

      it { should eq('Safra de Soja #5') }
    end
  end
end
