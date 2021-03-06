class TopicsController < ApplicationController
before_action :topic_index, only: [:index]
before_action :set_topics, only: [:new]

  def new
    @topic = Topic.new
  end  


  def index
  end
  
  


  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

 
  private
  def topic_index
    @topics = Topic.all.includes(:favorite_users)
  end

  def set_topics
    if @current_user == nil
      redirect_to("/login")
    end
  end

  def topic_params
    params.require(:topic).permit(:image, :description)
  end

end