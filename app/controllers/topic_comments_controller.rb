class TopicCommentsController < ApplicationController
  def index
    @topic_comments = TopicComments.find(params[:id])
  end
  def new
    @topic_comment = TopicComment.new
    @project = Project.find(params[:project_id])
    @topic = Topic.find(params[:topic_id])
  end
  def create
    @topic_comment = current_user.topic_comments.new(topic_comment_params)
    @topic_comment.user_id = current_user.id
    @topic_comment.project_id = params[:project_id]
    @topic_comment.topic_id = params[:topic_id]
    if @topic_comment.save
      redirect_to project_topics_path,success: "コメントに成功しました"
    else
      flash.now[:danger] = "コメントに失敗しました"
      render :new
    end
  end

  private
  def topic_comment_params
    params.require(:topic_comment).permit(:body)
  end
end
