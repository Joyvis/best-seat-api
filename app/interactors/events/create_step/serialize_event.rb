# frozen_string_literal: true

module Events
  module CreateStep
    class SerializeEvent
      include Interactor

      delegate :event, to: :context

      def call
        context.event = serialize_event(event)
      end

      private

      def serialize_event(event)
        EventSerializer.new(event)
      end
    end
  end
end
