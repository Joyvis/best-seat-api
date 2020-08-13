# frozen_string_literal: true

module Reservations
  module CreateStep
    class NormalizeParameters
      include Interactor

      delegate :reservations_params, to: :context

      def call
        context.reservations_params = normalize_params(reservations_params)
      end

      private

      def normalize_params(reservations_params)
        return reservations_params if reservations_params.is_a?(Array)

        reservations_params.require(:reservations).map do |param|
          param.permit(:row, :column)
        end
      end
    end
  end
end
