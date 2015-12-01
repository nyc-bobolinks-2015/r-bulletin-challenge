class ConversationsController < ApplicationController

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
  end

  def create
    @topic = Topic.find(params[:conversation][:topic_id])
    @conversation = Conversation.new(author: current_user, topic: @topic, name: params[:conversation][:name])
    if @conversation.save
      if request.xhr?
        render partial: "conversation", locals: {conversation: @conversation}
      else
        redirect_to topic_path(@topic)
      end
    else
      render topic_path(@topic)
    end
  end

end
