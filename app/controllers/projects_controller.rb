class ProjectsController < ApplicationController
  before_action :find_project, only: [:edit, :update, :destroy]

  def create
    @project = Project.new project_params
    @project.profile = current_user_profile
    if @project.save
      redirect_to edit_profile_path(current_user_profile), notice: "Project added."
      else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update project_params
      redirect_to profile_path(current_user_profile), notice: "Project updated"
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to profile_path(current_user_profile), notice: "Project removed"
  end

  private

  def find_project
    @project = Project.find params[:id]
  end

  def project_params
    params.require(:project).permit(:title, :description, :project_url, :github_url)
  end

end
