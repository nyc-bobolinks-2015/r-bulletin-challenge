class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :'users/new'
    end
  end

  def show
    @messages = Message.recent(current_user)
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
