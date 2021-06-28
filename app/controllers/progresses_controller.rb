class ProgressesController < ApplicationController
  def index
  end
  def new
    @progress = Progress.new
  end
  def create
    @progress = current_user.progresses.new(progress_params)
    if @progress.save
      redirect_to progresses_index_path, success: "投稿に成功しました"
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
