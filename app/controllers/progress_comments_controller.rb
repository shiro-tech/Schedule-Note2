class ProgressCommentsController < ApplicationController
  def index
    @progress_comments = ProgressComments.find(params[:id])
  end
  def new
    @project = Project.find(params[:project_id])
    @progress = Progress.find(params[:progress_id])
    @progress_comment = ProgressComment.new
  end
  def create
    @progress_comment = current_user.progress_comments.new(progress_comment_params)
    @progress_comment.user_id = current_user.id
    @progress_comment.project_id = params[:project_id]
    @progress_comment.progress_id = params[:progress_id]
    # binding.pry
    if @progress_comment.save
      redirect_to project_progresses_path, success: 'コメントに成功しました'
    else
      flash.now[:danger] = "コメントに失敗しました"
      render :new
    end
  end

  private
  def progress_comment_params
    params.require(:progress_comment).permit(:body, :user_id, :progress_id)
  end

end
