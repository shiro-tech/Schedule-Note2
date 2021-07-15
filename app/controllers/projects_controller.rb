class ProjectsController < ApplicationController
  def index #一覧画面
    @projects = Project.all
  end
  def show #詳細画面
    @project = Project.find(params[:id])
  end
  def edit
    @project = Project.find(params[:id])
  end
  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to projects_path, success: '編集に成功しました'
  end
  def new
    @project = Project.new
  end
  def create
    @project = current_user.projects.new(project_params)
    # binding.pry
    if @project.save
      redirect_to projects_path, success: '登録が成功しました'
    else
      flash.now[:danger] = "登録が失敗しました"
      render :new
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, succcess: "案件を削除しました"
  end

  private
  def project_params
    params.require(:project).permit(:workperiod, :title)
  end
end
