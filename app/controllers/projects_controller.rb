class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
    end

    def edit
        
    end

    def create
        @project = Project.new(project_params)
        @project = Project.first

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


end