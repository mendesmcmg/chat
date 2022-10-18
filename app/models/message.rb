class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  paginates_per 10
end
