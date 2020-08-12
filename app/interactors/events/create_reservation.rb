# frozen_string_literal: true

module Events
  class CreateReservation
    include Interactor

    delegate :event, :reservations_params, to: :context

    def call
      Reservation.transaction do
        event.reservations.create!(reservations_params[:reservations])
      end

      context.reservations = event.reservations
    rescue ActiveRecord::RecordInvalid => error
      context.error = error
      context.fail!
    end
  end
end
