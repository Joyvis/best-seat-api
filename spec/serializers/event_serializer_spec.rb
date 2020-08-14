# frozen_string_literal: true

require 'rails_helper'

describe EventSerializer, type: :serializer do
  let(:event) { create(:event) }

  subject { described_class.new(event).serializable_hash }

  describe 'checking attributes presence' do
    it { is_expected.to include(:id) }
    it { is_expected.to include(:name) }
    it { is_expected.to include(:rows) }
    it { is_expected.to include(:columns) }
    it { is_expected.to include(:free_seats) }
  end
end
