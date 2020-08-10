# frozen_string_literal: true

require 'rails_helper'

describe Events::ListBestSeat, type: :interactor do
  describe '#organizer' do
    it 'steps has been organized' do
      expect(described_class.organized).to(
        eq(
          [
            Events::ListBestSeatStep::CreateEventArrayModel,
            Events::ListBestSeatStep::FindPerfectSeat,
            Events::ListBestSeatStep::FindBestSeatByScore
          ]
        )
      )
    end
  end
end
