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
      render nothing: true
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @list.destroy
      render nothing: true
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  private

    def list_params
      params.permit(:name)
    end
end