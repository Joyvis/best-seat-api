# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :reservations

  validates_presence_of :name, :rows, :columns
end
