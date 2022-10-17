class Room < ApplicationRecord
  has_many :user_rooms

  def add_user(user)
    user_rooms = UserRoom.where(:user_id => user.id)
    user_rooms.each do |user_room|
      user_room.active = false
      user_room.save
    end
    
    current_user_room = UserRoom.find_or_create_by(:user_id => user.id, :room_id => self.id)
    current_user_room.active = true
    current_user_room.save
  end
end
