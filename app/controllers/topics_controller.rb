class TopicsController < ApplicationController
  def index
    @categories = Category.includes(:topics).order(:display_order)
    @conversations = Conversation.by_recency
    @messages = Message.my_recent(current_user)
    @my_conversations = Conversation.my_conversations(current_user)
  end

  def show
    redirect_to topic_conversations_path(Topic.find(params[:id]))
  end
end