# frozen_string_literal: true

require 'rails_helper'

describe Reserve, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:event) }
  end

  describe 'validatations' do
    before { create(:reserve) }

    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:event) }
    it { is_expected.to validate_presence_of(:seat_code) }
    it { is_expected.to validate_uniqueness_of(:seat_code).scoped_to(:event_id) }
  end
end
