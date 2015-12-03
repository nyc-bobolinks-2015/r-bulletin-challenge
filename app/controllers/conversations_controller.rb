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

  def create
    conversation = Conversation.new(conversation_params)
    binding.pry
    @topic = Topic.find(conversation.topic_id)
    if conversation.save
      render partial: 'conversation', locals {conversation: conversation}
    end
  end

  private
  def conversation_params
    params.require(:conversation).permit(:name, :topic_id, :user_id)
  end
end
