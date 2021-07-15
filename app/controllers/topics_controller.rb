class TopicsController < ApplicationController
  def index
    @topics = Topic.order(created_at: "ASC")
  end
  def new
    @topic = Topic.new
    @project = Project.find(params[:project_id])
  end

  def create
    @topic = current_user.topics.new(topic_params)
    @topic.user_id = current_user.id
    @topic.project_id = params[:project_id]
    # binding.pry
    if @topic.save
      redirect_to project_topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    @project = Project.find(params[:project_id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to project_topics_path, success: '編集に成功しました'
    else
      flash.now[:danger] = "編集に失敗しました"
      render :new
    end
  end
  def destory
    @topic = Topic.find(params[:id])
    if @topic.destroy
      redirect_to project_topics_path, success: '削除に成功しました'
    else
      flash.now[:danger] = "削除に失敗しました"
      render :new
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :file, :article)
  end
end
