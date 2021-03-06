# frozen_string_literal: true

require 'rails_helper'

describe Reservations::Create, type: :interactor do
  describe '#organizer' do
    it 'steps has been organized' do
      expect(described_class.organized).to(
        eq(
          [
            Reservations::CreateStep::NormalizeParameters,
            Reservations::CreateStep::SaveReservation,
            Reservations::CreateStep::SerializeReservation
          ]
        )
      )
    end
  end
end
