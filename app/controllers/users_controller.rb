class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(permit_params)
    if user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @messages = Message.where(user_id: session[:user_id]).order(created_at: :desc)
    @conversations = Conversation.where(user_id: session[:user_id])
  end


  private

  def permit_params
    params.require(:user).permit(:username,:password)
  end
end
