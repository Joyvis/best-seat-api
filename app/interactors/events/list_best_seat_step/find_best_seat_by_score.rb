# frozen_string_literal: true

module Events
  module ListBestSeatStep
    class FindBestSeatByScore
      include Interactor

      delegate :event_array_model, :quantity, :event, :perfect_seat,
               to: :context

      def call
        scores = calculate_score
        send_error if scores.blank?

        context.best_seats = scores.min.last
      end

      private

      def calculate_score
        row_scores = {}
        event_array_model.each_with_index do |row, row_index|
          seat_score = scan_row(row, row_index)
          row_scores.reverse_merge!(seat_score)
        end

        row_scores
      end

      def scan_row(row, row_index)
        scores = {}
        row.each_with_index do |_seat, index|
          score = calculate_seats_score(row, index, row_index)
          next if score.nil?

          scores[score] = location(index, row_index) if scores[score].nil?
        end

        scores
      end

      def calculate_seats_score(row, index, row_index)
        return unless row[index, quantity].tally[:free] == quantity

        score = 0
        (0..event.columns).to_a[index, quantity].each do |counter|
          score += calculate_column_score(counter) + row_index
        end

        score
      end

      def calculate_column_score(counter)
        column_score = perfect_seat[:column] - counter
        column_score * -1 if column_score.negative?

        column_score
      end

      def location(index, row_index)
        (0..event.columns).to_a[index, quantity].map do |column|
          reservation_attributes = {
            column: column + 1,
            row: row_index + 1,
            event_id: event.id
          }

          Reservation.new(reservation_attributes).tap(&:valid?)
        end
      end

      def send_error
        context.errors = {
          errors: {
            base: [ I18n.t('reservation.no_best_seat_available') ]
          }
        }

        context.fail!
      end
    end
  end
end
