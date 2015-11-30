class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end


  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params[:topic])
    if @topic.save

    else

    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    topic.assign_attributes(params[:topic])
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    redirect_to root_path
  end

end
