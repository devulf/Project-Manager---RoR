class ProjectsController < ApplicationController


def index
    @projects = Project.search(params[:search])
    @tickets = Ticket.all
    @projects_sorted = @projects.sort_by(&:updated_at).reverse
    @project_id= session[:user_id]
  end

  def show
    @project = Project.find(params[:id])
    @users = User.all
    @session = User.find(session[:user_id])
    @user_id= session[:user_id]
    @included = @project.users.include? (@session)
  end

  def destroy
    @project = Project.find(params[:id])
    @project_id= session[:user_id]

    if(@project.user_id == @project_id)
      Project.destroy(params[:id])
      redirect_to projects_path
      flash[:notice] = "Project deleted!"

    else
      redirect_to :action => 'show', :id => @project.id
    end
  end

 def edit
    @session_id = User.find(session[:user_id]).id
    @project = Project.find(params[:id])
    @users = User.all
    @session_id = session[:user_id]
    @users = User.where("id != ?", @session_id)
    if(@project.user_id == @session_id)
      @project = Project.find(params[:id])

    else
      redirect_to :action => 'show', :id => @project.id
    end
  end

  def update
    @session_id = User.find(session[:user_id]).id
    @project = Project.find(params[:id])
     @users = User.where("id != ?", @session_id)
    if(@project.user_id == @session_id)
      if @project.update_attributes(params[:project])
        redirect_to :action => 'show', :id => @project.id
        flash[:notice] = "Project updated!"
      else
        render 'edit'
      end
    end
  end

  def new
    @project = Project.new
    @users = User.all
    @session_id = session[:user_id]
    @users = User.where("id != ?", @session_id)
end

  def create
    @project = Project.new(params[:project])
    @project.user_id = session[:user_id]
    @session_id = session[:user_id]
    @users = User.where("id != ?", @session_id)

    if @project.save
      redirect_to projects_path
      flash[:notice] = "Project created!"
    else
      render :action => "new"
    end
  end
end
