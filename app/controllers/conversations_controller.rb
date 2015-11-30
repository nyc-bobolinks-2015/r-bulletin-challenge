class ConversationsController < ApplicationController

  def show
    @conversation = Conversation.find_by(id: params[:conversation_id])
  end

end
