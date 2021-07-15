class ProgressesController < ApplicationController
  def index
    @progresses = Progress.order(created_at: "ASC")
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
    @project = Project.find(params[:project_id])
    @progress = Progress.find(params[:id])
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
    @progress.destroy
    redirect_to project_progresses_path(project_id: params[:project_id]), success:"削除に成功しました"
  end

  private
  def progress_params
    params.require(:progress).permit(:title, :file, :article, :other)
  end
end
