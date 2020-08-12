# frozen_string_literal: true

class Reservation < ApplicationRecord
  before_validation :generate_seat_code

  belongs_to :event

  validates_uniqueness_of :seat_code, scope: :event_id, case_sensitive: false
  validates_presence_of :event, :seat_code, :row, :column

  private

  def generate_seat_code
    self.seat_code = "#{seat_code_dictionary(row)}#{column}" if row && column
  end

  def seat_code_dictionary(index = 1)
    ('A'..'Z').to_a[index - 1]
  end
end
