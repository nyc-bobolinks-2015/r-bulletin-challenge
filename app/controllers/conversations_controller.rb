class ConversationsController < ApplicationController
  def index
    @topic = Topic.find(params[:topic_id])
    @conversations = @topic.conversations.order(updated_at: :desc)
    @new_conversation = Conversation.new
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
    conversation = Conversation.new(conversation_params)
    if conversation.save
      if request.xhr?
        render partial: conversation, locals: {conversation: conversation}, layout: false
      else
        redirect_to topic_path(params[:topic_id])
      end
    else
      render 'topics/show'
    end
  end

private
  def conversation_params
    params.require(:conversation).permit(:topic_id, :name).merge(user_id: current_user.id)
  end

end
