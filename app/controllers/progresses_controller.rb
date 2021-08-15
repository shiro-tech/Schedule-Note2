class ProgressesController < ApplicationController
  def index
    @progresses = Progress.order(created_at: "ASC")
    # @progress_comment = ProgressComment.find(params[:id])
  end
  def new
    @project = Project.find(params[:project_id])
    @progress = Progress.new
  end
  def create
    @progress = current_user.progresses.new(progress_params)
    @progress.user_id = current_user.id
    @progress.project_id = params[:project_id]
    # binding.pry
    if @progress.save
      redirect_to project_progresses_path, success: "投稿に成功しました"
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
    @progress = Progress.find(params[:id])
    @project = Project.find(params[:project_id])
  end

  def update
    @progress = Progress.find(params[:id])
    # binding.pry
    if @progress.update(progress_params)
      redirect_to project_progresses_path, success: "投稿に成功しました"
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  def destroy
    @progress = Progress.find(params[:id])
    if @progress.destroy
      redirect_to project_progresses_path(project_id: params[:project_id]), success:"削除に成功しました"
    end
  end

  private
  def progress_params
    params.require(:progress).permit(:title, :image, :article, :other)
  end
end
