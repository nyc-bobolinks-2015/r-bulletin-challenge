class MessagesController < ApplicationController
  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @conversation = Conversation.find(params[:message][:conversation_id])
    if @message.save
      if request.xhr?
        render partial: "message" , locals: {message: @message}
      else
        redirect_to conversation_path(@conversation)
      end
    else

    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :conversation_id, :content)
  end

end
