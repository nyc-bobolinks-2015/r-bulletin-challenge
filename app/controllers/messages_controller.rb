class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(user_id: current_user.id, content: params[:content], conversation_id: params[:conversation_id])
    if @message.save
      redirect_to conversation_path(@message.conversation_id)
    else
      redirect_to conversation_path(@message.conversation_id)
    end
  end
end
