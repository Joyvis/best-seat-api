# frozen_string_literal: true

class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :event_id, :row, :column, :seat_code
end
