# frozen_string_literal: true

module Reservations
  module CreateStep
    class SaveReservation
      include Interactor

      delegate :event, :reservations_params, to: :context

      def call
        Reservation.transaction do
          event.reservations.create!(reservations_params)
        end

        context.reservations = event.reservations
      rescue ActiveRecord::RecordInvalid => error
        send_error(error)
      end

      private

      def send_error(error)
        context.errors = {
          errors: {
            error.class.name.demodulize.underscore => [error.to_s]
          }
        }

        context.fail!
      end
    end
  end
end
