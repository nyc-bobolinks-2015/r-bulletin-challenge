class SessionController < ApplicationController

  def create
    u = User.find_by(username: params[:username])
    if u && u.authenticate(params[:password])
      session[:user_id] = u.id
      redirect_to root_path
    else
      render '/session/new'
    end
  end

  def destroy
    session.clear
  end
end
