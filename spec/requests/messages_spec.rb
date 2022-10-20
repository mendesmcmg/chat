require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe "GET rooms/:room_id/messages(/page/:page)" do
    it 'gets paginated messages' do
      room1 = Room.create(name: 'no1')
      user1 = User.create(name: 'no1')
      for i in 0..20 do
        Message.create(user_id: user1.id, room_id: room1.id, text: "oi #{i}")
      end

      get "/rooms/#{room1.id}/messages"
      body = JSON.parse(response.body)
      
      expect(Message.all.length).to eq 21
      expect(body.length).to eq 10
    end
  end

  describe 'POST rooms/:room_id/messages' do
    it 'posts message' do
      room1 = Room.create(name: 'no1')
      user1 = User.create(name: 'no1')

      post "/rooms/#{room1.id}/messages?user_id=#{user1.id}&text=mensagem-enviada"
      body = JSON.parse(response.body)

      expect(body["text"]).to eq "mensagem-enviada"
    end
  end
end
