# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :reserves

  validates_presence_of :name, :rows, :columns
end
