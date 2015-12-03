class MessagesController < ApplicationController
  def create
    msg = Message.create(message_params)
    if msg.save
      redirect_to topic_conversation_path(msg.conversation.topic, msg.conversation)
    else
      @conversation = Conversation.find(params[:message][:conversation_id])
      flash.now.alert = msg.errors.full_messages.join(', ')
      render 'conversations/show'
    end
  end

  def like
    @msg = Message.find(params[:id])
    like = current_user.likes.build(user: current_user, message: @msg)
    if like.save
      render partial: "message", locals: {message: @msg}
    else
      render partial: "message", locals: {notice: like.errors.full_messages.join(" | ")}
    end
  end

  private
  def message_params
    params.require(:message).permit(:conversation_id, :content).merge(user: current_user)
  end
end
