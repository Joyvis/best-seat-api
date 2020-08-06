# frozen_string_literal: true

class Reserve < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates_uniqueness_of :seat_code, scope: :event_id
  validates_presence_of :user, :event, :seat_code
end
