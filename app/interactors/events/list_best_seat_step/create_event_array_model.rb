# frozen_string_literal: true

module Events
  module ListBestSeatStep
    class CreateEventArrayModel
      include Interactor

      delegate :event, :quantity, to: :context

      def call
        array_model = create_array_model
        event.reservations.each do |reservation|
          array_model[reservation.row - 1][reservation.column - 1] = :reserved
        end
        send_error unless free_seats_enough?(array_model)

        context.event_array_model = array_model
      end

      private

      def create_array_model
        Array.new(event.rows) { Array.new(event.columns, :free) }
      end

      def free_seats_enough?(array_model)
        array_model.flatten.tally[:free].present? &&
          array_model.flatten.tally[:free] >= quantity
      end

      def send_error
        context.errors = {
          errors: {
            base: [ I18n.t('reservation.there_are_not_enough_seats') ]
          }
        }

        context.fail!
      end
    end
  end
end
