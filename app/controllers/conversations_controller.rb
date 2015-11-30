class ConversationsController < ApplicationController

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
  end

  def create
    @topic = Topic.find(params[:conversation][:topic_id])
    @conversation = Conversation.new(author: current_user, topic: @topic, name: params[:conversation][:name])
    if @conversation.save
      redirect_to topic_path(@topic)
    else
      render topic_path(@topic)
    end
  end

  # private

  # def conversation_params
  #   params.require(:conversation).permit(:name)
  # end
end
