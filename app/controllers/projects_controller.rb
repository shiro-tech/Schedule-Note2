class ProjectsController < ApplicationController
  def index #一覧画面
  end
  def show #詳細画面
  end
  def new
  end
  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to projects_index_path, success: '登録が成功しました'
    else
      flash.now[:danger] = "登録が失敗しました"
      render :new
    end
  end

  private
  def project_params
    params.require(:projects).permit(:workperiod, :title)
  end
end
