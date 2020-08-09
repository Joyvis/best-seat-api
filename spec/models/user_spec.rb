# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:reservations) }
  end

  describe 'validatations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
  end
end
