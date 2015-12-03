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
    topic_id = params[:topic_id][0]
    @topic = Topic.find(topic_id)
    p @topic
    @conversation = Conversation.new

    if request.xhr?
      render partial: "form", locals: {topic: @topic, conversation: @conversation}
    end
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
