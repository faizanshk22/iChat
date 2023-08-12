class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
      @users = User.where.not(id: current_user.id)
    end

    def show
      @user = User.find(params[:id])  
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
    def user_params
      params.require(:user).permit(:full_name, :email, :password)
    end
end