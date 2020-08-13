# frozen_string_literal: true

module Events
  module ListBestSeatStep
    class SerializeSeats
      include Interactor

      delegate :best_seats, to: :context

      def call
        context.seats = serialize_seats(best_seats)
      end

      private

      def serialize_seats(seats)
        ActiveModel::Serializer::CollectionSerializer
          .new(seats, each_serializer: ReservationSerializer)
      end
    end
  end
end
