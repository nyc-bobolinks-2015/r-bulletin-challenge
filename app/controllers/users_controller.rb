class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    if current_user == @user
      render  :show
    else
      redirect_to '/?notice=Unauthorized Access'
    end
  end

  def create
    @user = User.new(user_params)
    if (@user.save)
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
