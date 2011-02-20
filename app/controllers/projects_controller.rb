class ProjectsController < ApplicationController
  
  def index
    @projects = Project.find(:all).paginate(:page => params[:page], :per_page => 5)
  end
  
  def show
    @project = Project.find(params[:id])
    @talks = @project.talks.all.paginate(:page => params[:talks_page], :per_page => 2)

  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    @project.user = current_user
    if @project.save
      redirect_to project_path(@project)
    else
      render :action => :new
    end
  end

  def edit
    @project = Project.find(params[:id])
    redirect_to projects_path if @project.user != current_user
  end
  
  def update
    @project = Project.find(params[:id])
    redirect_to projects_path if @project.user != current_user
    @project.update_attributes(params[:project])
    if @project.save
      redirect_to project_path(@project)
    else
      render :action => :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    redirect_to projects_path if @project.user != current_user
    @project.destroy
    redirect_to projects_path
  end
  
end
