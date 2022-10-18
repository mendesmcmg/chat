require 'rails_helper'
require 'json'

RSpec.describe "Rooms", type: :request do
  # post 'rooms/join' => 'rooms#join'
  # post 'rooms/:room_id/leave' => 'rooms#leave'

  describe "GET /:room_id/active_users" do
    it "retrieves active users with one user" do
      user1 = User.create!(name: "no1")
      room1 = Room.create!(name: "no1")
      room1.add_user(user1)

      get "/rooms/#{room1.id}/active_users"
      body = JSON.parse(response.body)

      expect(body.length).to eq 1
      expect(body[0]["name"]).to eq "no1"
      expect(body[0]["id"]).to eq user1.id
    end
  end
end
