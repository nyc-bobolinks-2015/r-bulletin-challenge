class ConversationsController < ApplicationController
  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.new(user_id: current_user.id, topic_id: params[:topic_id], name: params[:name])
    if @conversation.save
      redirect_to topic_path(@conversation.topic_id)
    else
      redirect_to topic_path(@conversation.topic_id)
    end
  end

  def show
    @conversation = Conversation.find_by(id: params[:id])
  end
end
