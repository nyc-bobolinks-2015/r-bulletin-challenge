class ConversationsController < ApplicationController

  def show
    @conversation = Conversation.find_by(id: params[:conversation_id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @conversation = @topic.conversations.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @conversation = @topic.conversations.new(name: params[:conversation][:name])
    @conversation.user_id = current_user.id
    if @conversation.save
      redirect_to topic_path(@topic)
    else
      render :'conversations/new'
    end
  end

end
