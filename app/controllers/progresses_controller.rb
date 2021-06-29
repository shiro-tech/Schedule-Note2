class ProgressesController < ApplicationController
  def index
    @progresses = Progress.all
  end
  def new
    @progress = Progress.new
  end
  def create
    @progress = current_user.progresses.new(progress_params)
    @progress.user_id = current_user.id
    # @progress.project_id = Progress.find_by(params[:project_id])
    binding.pry
    if @progress.save
      redirect_to progresses_path, success: "投稿に成功しました"
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  private
  def progress_params
    params.require(:progress).permit(:title, :file, :article, :other)
  end
end
