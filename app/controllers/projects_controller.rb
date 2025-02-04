class ProjectsController < ApplicationController
  before_action :set_project , only: [:show, :update]

  def index
    @projects = Project.order(created_at: :desc).page(params[:page])
  end

  def show
    @project_activities = @project.project_activities.includes(:user).order(created_at: :desc)
    @project_comments = @project.comments.includes(:user).order(:created_at)
  end

  def update
    if @project.update(update_params) && @project.saved_change_to_status?
      @project.project_activities.create(user: current_user, new: @project.status, old: @project.status_before_last_save)
      redirect_to project_path(@project)
    else
      render :show, flash: { error: @project.errors.full_messages.join(', ') }
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def update_params
    params.require(:project).permit(:status)
  end
end
