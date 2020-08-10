# frozen_string_literal: true

module Events
  module ListBestSeatStep
    class FindPerfectSeat
      include Interactor

      delegate :event_array_model, to: :context

      def call
        context.perfect_seat = perfect_seat
      end

      private

      def perfect_seat
        seat_column = event_array_model[0].count.to_f / 2
        return seat_column - 1 if (seat_column % 1).zero?

        { row: 0, column: seat_column.ceil - 1 }
      end
    end
  end
end
