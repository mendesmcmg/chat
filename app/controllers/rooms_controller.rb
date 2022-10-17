class RoomsController < ApplicationController
  def join
    user = User.find_or_create_by(name: params[:user])
    room = Room.find_or_create_by(name: params[:room])
    room.add_user(user)

    render json: room
  end
end
