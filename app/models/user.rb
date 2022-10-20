# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_rooms
  validates :name, uniqueness: true, format: { without: /\s/, message: 'No empty spaces on user name please :(' }
end
