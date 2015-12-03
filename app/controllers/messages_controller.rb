class MessagesController < ApplicationController
  def create
    message = Message.create(message_params)
    if message.save
      if request.xhr?
        render partial: message, locals: {message: message}, layout: false
      else
        redirect_to topic_conversation_path(msg.conversation.topic, msg.conversation)
      end
    else
      @conversation = Conversation.find(params[:message][:conversation_id])
      flash.now.alert = msg.errors.full_messages.join(', ')
      render 'conversations/show'
    end
  end

  def recent
    @messages = Message.my_recent
  end

  private

  def message_params
    params.require(:message).permit(:conversation_id, :content).merge(user: current_user)
  end

end