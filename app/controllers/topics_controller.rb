class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find_by(id: params[:id])
    @recent_convos = Conversation.recent(@topic)
    @old_convos = Conversation.old(@topic)
  end
end
