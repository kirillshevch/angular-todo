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

  def destroy
    if @project.destroy
      render json: @project
    end
  end
end