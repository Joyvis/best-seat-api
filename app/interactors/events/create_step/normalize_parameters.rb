# frozen_string_literal: true

module Events
  module CreateStep
    class NormalizeParameters
      include Interactor

      delegate :event_params, to: :context

      def call
        context.event_params = normalize_params(event_params)
      end

      private

      def normalize_params(event_params)
        return event_params if event_params.is_a?(Hash)

        event_params.require(:event).permit(:name, :rows, :columns)
      end
    end
  end
end
