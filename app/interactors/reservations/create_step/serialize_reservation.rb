# frozen_string_literal: true

module Reservations
  module CreateStep
    class SerializeReservation
      include Interactor

      delegate :reservations, to: :context

      def call
        context.reservations = serialize_reservation(reservations)
      end

      private

      def serialize_reservation(reservations)
        ActiveModel::Serializer::CollectionSerializer
          .new(reservations, each_serializer: ReservationSerializer)
      end
    end
  end
end
