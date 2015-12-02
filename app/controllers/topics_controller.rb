class TopicsController < ApplicationController
  def index
    @categories = Category.includes(:topics).order(:display_order)
    @recent_conversations = Conversation.get_recently_active_convos
  end

  def show
    redirect_to topic_conversations_path(Topic.find(params[:id]))
  end
end
