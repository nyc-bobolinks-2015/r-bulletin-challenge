class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = current_user
    @recent_messages = @user.recent_messages
    @conversations = @user.conversations

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
