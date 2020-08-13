# frozen_string_literal: true

require 'rails_helper'

describe Events::Create, type: :interactor do
  describe '#organizer' do
    it 'steps has been organized' do
      expect(described_class.organized).to(
        eq(
          [
            Events::CreateStep::NormalizeParameters,
            Events::CreateStep::SaveEvent,
            Events::CreateStep::SerializeEvent
          ]
        )
      )
    end
  end
end
