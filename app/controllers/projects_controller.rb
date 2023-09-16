class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def show
    end

    def index
        @projects = Project.paginate(page: params[:page], per_page: 5)
    end

    def new
        @project = Project.new
    end

    def edit
        
    end

    def create
        @project = Project.new(project_params)
        @project.user = current_user

        if @project.save
            flash[:notice] = "Project was created successfully"
            redirect_to @project
        else
            render 'new'
        end
    end

    def update
        if @project.update(project_params)
            flash[:notice] = "Project was updated successfully"
            redirect_to @project
        else
            render 'edit'
        end
    end

    def destroy
        @project.destroy
        redirect_to @project
    end

    private

    def set_project
        @project = Project.find(params[:id])
    end

    def project_params
        params.require(:project).permit(:title, :description, :image)
    end

    def require_same_user
        if current_user != @project.user
            flash[:alert] = "You can only edit or delete your own project"
            redirect_to @project
        end
    end


end