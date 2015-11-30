class MessagesController < ApplicationController

  def new
    if session[:user_id]
      @conversation=Conversation.find(params[:conversation_id])
      @message = Message.new
      render :_new, layout:!request.xhr?
    else
      redirect_to login_path
    end
  end

  def create
    conversation = Conversation.find(params[:conversation_id])
    @message = conversation.messages.build(content:params[:message][:content],user_id:session[:user_id])
    if @message.save
      if request.xhr?
        render :_new_message, layout:false
      else
        redirect_to conversation_path(conversation)
      end
    else
      render :new
    end
  end
end
