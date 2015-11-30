class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(permitted_params)
  end

  private
  def permitted_params
    params.require(:user).permit(:username, :email, :password)
  end

end
