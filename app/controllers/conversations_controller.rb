class ConversationsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @conversations = @topic.conversations.order(updated_at: :desc)
  end

  def show
    @conversation = Conversation.find(params[:id])
  end

  def recent
    @conversations = Conversation.by_recency
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @conversation = Conversation.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @conversation = @topic.conversations.new(name: params[:conversation][:name])
    @conversation.user_id = current_user.id

    if @conversation.save
      redirect_to topic_conversations_path(@topic)
    else
      render :'conversations/new'
    end
  end
end
