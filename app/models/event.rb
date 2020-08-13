# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :reservations

  validates_presence_of :name, :rows, :columns
  validates :rows, numericality: {
    more_than_or_equal_to: 1,
    less_than_or_equal_to: 26,
    only_integer: true
  }
end
