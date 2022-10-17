require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'adds user to room' do   #
    user = User.create(name: "TestUser")
    room = Room.create(name: "TestRoom")
    
    room.add_user(user)

    expect(room.user_rooms.length).to eq 1
    expect(room.user_rooms.first.user_id).to eq user.id
    expect(room.user_rooms.first.active).to eq true
  end

  it 'removes user from previous room' do   #
    user = User.create(name: "TestUser")
    room1 = Room.create(name: "TestRoom1")
    room2 = Room.create(name: "TestRoom2")
    
    room1.add_user(user)
    room2.add_user(user)

    expect(room1.user_rooms.first.active).to eq false
    expect(room2.user_rooms.first.active).to eq true

    user_room = UserRoom.find_by(user_id: user.id, room_id: room2.id)
    expect(user_room.active).to be true
  end

  it 'adds 3 users and removes the second one' do #
    user1 = User.create(name: "TestUser1")
    user2 = User.create(name: "TestUser2")
    user3 = User.create(name: "TestUser3")

    room1 = Room.create(name: "TestRoom1")
    room2 = Room.create(name: "TestRoom2")

    room1.add_user(user1)
    room1.add_user(user2)
    room1.add_user(user3)

    room2.add_user(user2)

    user1_room1 = UserRoom.find_by(user_id: user1.id, room_id: room1.id)
    user2_room1 = UserRoom.find_by(user_id: user2.id, room_id: room1.id)
    user3_room1 = UserRoom.find_by(user_id: user3.id, room_id: room1.id)
    user2_room2 = UserRoom.find_by(user_id: user2.id, room_id: room2.id)

    expect(user1_room1.active).to eq true
    expect(user2_room1.active).to eq false
    expect(user3_room1.active).to eq true
    expect(user2_room2.active).to eq true
  end

  it 'returns user to previous room' do   #
    user = User.create(name: "TestUser")
    room1 = Room.create(name: "TestRoom1")
    room2 = Room.create(name: "TestRoom2")
    
    room1.add_user(user)
    room2.add_user(user)

    expect(room1.user_rooms.first.active).to eq false
    expect(room2.user_rooms.first.active).to eq true

    user_room = UserRoom.find_by(user_id: user.id, room_id: room2.id)
    expect(user_room.active).to be true

    room1.add_user(user)
    user_room = UserRoom.find_by(user_id: user.id, room_id: room1.id)
    expect(user_room.active).to be true
  end
end
