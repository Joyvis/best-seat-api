# frozen_string_literal: true

module Events
  module CreateStep
    class SaveEvent
      include Interactor

      delegate :event_params, to: :context

      def call
        event = Event.new(event_params)

        if event.save
          context.event = event
        else
          send_error(event)
        end
      end

      private

      def send_error(event)
        context.errors = { errors: event.errors.messages }
        context.fail!
      end
    end
  end
end
