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
      rescue ActiveRecord::RecordInvalid
        send_error
      end

      private

      def send_error
        context.errors = {
          errors: {
            base: [I18n.t('reservation.seats_are_not_available')]
          }
        }

        context.fail!
      end
    end
  end
end
