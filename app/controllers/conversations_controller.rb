class ConversationsController < ApplicationController

  def show
    @conversation = Conversation.find_by(id: params[:id])
  end

end
