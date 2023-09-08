class ProjectsController < ApplicationController

    def show
        @project = Project.find(params[:id])
    end

    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
    end

    def edit
        @project = Project.find(params[:id])
    end

    def create
        @project = Project.new(params.require(:project).permit(:title, :description, :image))
        if @project.save
            flash[:notice] = "Article was created successfully"
            redirect_to @project
        else
            render 'new'
        end
    end

    def update
        @project = Project.find(params[:id])
        if @project.update(params.require(:project).permit(:title, :description, :image))
            flash[:notice] = "Project was updated successfully"
            redirect_to @project
        else
            render 'edit'
        end
    end

end