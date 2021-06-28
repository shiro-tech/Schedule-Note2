class TopicsController < ApplicationController
  def index
  end
  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)
    # binding.pry
    if @topic.save
      redirect_to topics_index_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :file, :article)
  end
end
