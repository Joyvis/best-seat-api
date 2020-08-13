# frozen_string_literal: true

require 'rails_helper'

describe ReservationSerializer, type: :serializer do
  let(:reservation) { create(:reservation) }

  subject { described_class.new(reservation).serializable_hash }

  describe 'checking attributes presence' do
    it { is_expected.to include(:id) }
    it { is_expected.to include(:event_id) }
    it { is_expected.to include(:row) }
    it { is_expected.to include(:column) }
    it { is_expected.to include(:seat_code) }
  end
end
