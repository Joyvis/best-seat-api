# frozen_string_literal: true

require 'rails_helper'

describe Reservation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:event) }
  end

  describe 'validatations' do
    before { create(:reservation) }

    it { is_expected.to validate_presence_of(:event) }
    it { is_expected.to validate_presence_of(:row) }
    it { is_expected.to validate_presence_of(:column) }
    it { is_expected.to validate_presence_of(:seat_code) }
    it do
      is_expected.to validate_uniqueness_of(:seat_code)
        .scoped_to(:event_id).case_insensitive
    end
  end
end
