# frozen_string_literal: true

require 'rails_helper'
require 'json'

RSpec.describe 'Rooms', type: :request do
  # post 'rooms/:room_id/leave' => 'rooms#leave'

  describe 'POST /rooms/join' do
    it 'adds user to room' do
      post "/rooms/join?user=1user&room=1room"

      expect(User.last.name).to eq ("1user")
      expect(Room.last.name).to eq ("1room")
      expect(UserRoom.last.active).to eq (true)
    end
  end

  describe 'POST /rooms/:room_id/leave' do
    it 'makes user leave room' do
      user1 = User.create!(name: 'no1')
      room1 = Room.create!(name: 'no1')
      room1.add_user(user1)

      post "/rooms/#{room1.id}/leave?user_id=#{user1.id}"

      expect(UserRoom.last.active).to eq false
    end
  end

  describe 'GET /:room_id/active_users' do
    it 'retrieves active users with one user' do
      user1 = User.create!(name: 'no1')
      room1 = Room.create!(name: 'no1')
      room1.add_user(user1)

      get "/rooms/#{room1.id}/active_users"
      body = JSON.parse(response.body)

      expect(body.length).to eq 1
      expect(body[0]['name']).to eq 'no1'
      expect(body[0]['id']).to eq user1.id
    end
  end
end
