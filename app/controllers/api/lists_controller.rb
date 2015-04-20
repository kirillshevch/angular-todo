class Api::ListsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def create
    if @list.save
      render json: @list
    end
  end

  def update
    if @list.update(list_params)
      render json: @list
    end
  end

  def destroy
    if @list.destroy
      render json: @list
    end
  end

  private

    def list_params
      params.permit(:name)
    end
end