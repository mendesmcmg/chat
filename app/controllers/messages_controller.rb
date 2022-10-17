class MessagesController < ApplicationController
  def index
    messages = Message.where(:room_id => params[:room_id] )

    render json: messages
  end

  def create
    message = Message.create(text: params[:text], user_id: params[:user_id], room_id: params[:room_id])
    
    render json: message
  end
end
