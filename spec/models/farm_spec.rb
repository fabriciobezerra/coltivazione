require 'rails_helper'

RSpec.describe Farm, type: :model do
  let(:name) { "Santiago" }
  let(:address) { "Rodovia Km 21" }
  let(:size) { 400 }
  let(:latitude) { 32.54545 }
  let(:longitude) { 45.42435 }
  subject { build(:farm, name: name, address: address, size: size,
                         latitude: latitude, longitude: longitude) }

  describe 'Validações' do
    context 'Nome' do
      context 'Presença' do
        let(:name) { nil }

        it 'must be present' do
          expect(subject).not_to be_valid
          expect(subject.errors).to be_added(:name, :blank)
        end
      end
    end

    context 'Endereço' do
      context 'Presença' do
        let(:address) { nil }

        it 'must be present' do
          expect(subject).not_to be_valid
          expect(subject.errors).to be_added(:address, :blank)
        end
      end
    end

    context 'Tamanho' do
      context 'Presença' do
        let(:size) { nil }

        it 'must be present' do
          expect(subject).not_to be_valid
          expect(subject.errors).to be_added(:size, :blank)
        end
      end
    end

    context 'Latitude' do
      context 'Presença' do
        let(:latitude) { nil }

        it 'must be present' do
          expect(subject).not_to be_valid
          expect(subject.errors).to be_added(:latitude, :blank)
        end
      end
    end

    context 'Tamanho' do
      context 'Longitude' do
        let(:longitude) { nil }

        it 'must be present' do
          expect(subject).not_to be_valid
          expect(subject.errors).to be_added(:longitude, :blank)
        end
      end
    end
  end
end
