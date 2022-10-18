require 'rails_helper'

RSpec.describe "Rooms", type: :request do
  # post 'rooms/join' => 'rooms#join'
  # post 'rooms/:room_id/leave' => 'rooms#leave'

  describe "GET /:room_id/active_users" do
    it "retrieves active users with one user" do
      user1 = User.create!(name: "no1")
      room1 = Room.create!(name: "no1")
      room1.add_user(user1)

      get "/rooms/#{room1.id}/active_users"
      puts room1.id
      expect(response.body).to eq "-"
    end
  end
end
