class ConversationsController < ApplicationController

  def index
    @topic = Topic.find(params[:topic_id])
    @conversations = @topic.conversations.order(updated_at: :desc)
    @new_conversation = Conversation.new
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages
    @new_message = Message.new
  end

  def create
    topic = Topic.find(params[:topic_id])
    @conversation = topic.conversations.build(name:params[:conversation][:name],user_id:session[:user_id])
    if @conversation.save
      if request.xhr?
        render :_new_conversation_entry,layout:false
      else
        redirect_to topic_conversations_path(topic)
      end
    else
      error=@conversation.errors.full_messages
      flash[:error]=error
      render :index
    end
  end

  def new
    @topic=Topic.find(params[:topic_id])
    @conversation=Conversation.new
    render :_new,layout:!request.xhr?
  end

end
