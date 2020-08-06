# frozen_string_literal: true

class User < ApplicationRecord
  has_many :reserves

  validates_presence_of :name, :email
end
