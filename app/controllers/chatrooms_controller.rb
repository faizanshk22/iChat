class ChatroomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @current_user = current_user
    @chatrooms = Chatroom.public_rooms
    @users = User.where.not(id: current_user.id)
  end
  def show
    @current_user = current_user
    @single_room = Chatroom.find(params[:id])
    @chatrooms = Chatroom.public_rooms
    @users = User.all_except(@current_user)
    @chatroom = Chatroom.new
    @message = Message.new
    @messages = @single_room.messages
    render "index"
  end
  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to chatrooms_path, notice: 'Room Created'
    end
  end

  private

  def chatroom_params
  params.permit(:name)
  end
end
