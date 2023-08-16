class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
      @users = User.where.not(id: current_user.id)
    end

    def show
      @user = User.find(params[:id])
      @current_user = current_user
      @chatrooms = Chatroom.public_rooms
      @users = User.all_except(@current_user)
      @chatroom = Chatroom.new
      @message = Message.new
      @chatroom_name = get_name(@user, @current_user)
      @single_room = Chatroom.where(name: @chatroom_name).first || Chatroom.create_private_room([@user, @current_user], @chatroom_name)
      @messages = @single_room.messages
  
      render "chatrooms/index"  
    end

    def new
      @user = User.new 
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to root_path, notice: 'User created successfully. Please confirm your email' 
      else
        render :new
      end  
    end

    def edit
      @user = current_user
    end

    def update
      @user = current_user
       if @user.update(user_params)
         redirect_to user_path(@user), notice: 'Profile updated successfully.'
       else
         render :edit
       end
    end

    def destroy
    end
   
    private
    def get_name(user1, user2)
      users = [user1, user2].sort
      "private_#{users[0].id}_#{users[1].id}"
    end
    def user_params
      params.require(:user).permit(:full_name, :email, :password)
    end
end