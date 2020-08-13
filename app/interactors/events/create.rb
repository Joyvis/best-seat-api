# frozen_string_literal: true

module Events
  class Create
    include Interactor::Organizer

    organize CreateStep::NormalizeParameters,
             CreateStep::SaveEvent,
             CreateStep::SerializeEvent
  end
end
