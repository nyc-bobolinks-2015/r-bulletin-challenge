class TopicsController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @topic = Topic.find_by(id: params[:id])
  end

end
