# frozen_string_literal: true

class RoomsController < ApplicationController
  def join
    user = User.find_or_create_by(name: params[:user])
    room = Room.find_or_create_by(name: params[:room])
    room.add_user(user)

    render json: room
  end

  def leave
    current_user_room = UserRoom.find_by(user_id: params[:user_id], room_id: params[:room_id])
    current_user_room.active = false
    current_user_room.save

    render json: current_user_room
  end

  def active_users
    active_user_rooms = UserRoom.where(active: true, room_id: params[:room_id])
    active_users = active_user_rooms.map(&:user)

    render json: active_users
  end
end
