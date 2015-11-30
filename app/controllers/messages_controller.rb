require 'byebug'
class MessagesController < ApplicationController

  def index
      @conversation = Conversation.find_by(id: params[:conversation_id])
  end

  def show
    @message = Message.find_by(id: params[:id])
  end

  def new
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.new
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.new(content: params[:message][:content])
    @message.user_id = current_user.id
    if @message.save
      redirect_to conversation_messages_path
    else
      render :'messages/show'
    end
  end


end
