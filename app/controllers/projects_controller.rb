class ProjectsController < ApplicationController
  layout "home"
  before_action :set_project, only: %i[show edit update toggle_admin add_member destroy]

  def index
    @all_projects = current_user.projects.or(Project.where(id: current_user.shared_projects.select(:id)))
    @created_projects = current_user.projects
    @shared_projects = current_user.shared_projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to projects_home_path, notice: "Project successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


  def show
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project updated successfully."
    else
      render :edit
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_home_path, notice: "Project successfully deleted."
    else
      redirect_to projects_home_path, alert: "Failed to delete project."
    end
  end

  def toggle_admin
    member = @project.project_members.find_by(user_id: params[:user_id])
    if member
      member.update(role: member.role == "admin" ? "member" : "admin")
      redirect_to @project, notice: "Admin status updated."
    else
      redirect_to @project, alert: "Member not found."
    end
  end

  def add_member
    user = User.find_by(email: params[:email])
    if user
      role = params[:is_admin] == "on" ? "admin" : "member"
      @project.project_members.create(user: user, role: role)
      redirect_to @project, notice: "Member added successfully."
    else
      flash.now[:alert] = "User not found"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
