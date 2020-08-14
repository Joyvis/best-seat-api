# frozen_string_literal: true

class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :rows, :columns, :free_seats

  def free_seats
    (object.rows * object.columns) - object.reservations.count
  end
end
