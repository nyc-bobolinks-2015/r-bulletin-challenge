class MessagesController < ApplicationController

def show
  @message = Message.find_by(id: params[:id])
end

end
