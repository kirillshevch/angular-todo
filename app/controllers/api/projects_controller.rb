class Api::ProjectsController < ApplicationController
  load_and_authorize_resource

  def index
    render json: @projects
  end

  def create
    if @project.save
      render json: @project
    end
  end

  def update
    if @project.update(project_params)
      render json: @project
    end
  end

  def destroy
    if @project.destroy
      render json: @project
    end
  end

  private

    def project_params
      params.permit(:id, :name)
    end
end