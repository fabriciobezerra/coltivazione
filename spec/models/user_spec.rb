# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:farms) }
  it { should have_many(:harvests) }
  it { should have_many(:events) }
end
