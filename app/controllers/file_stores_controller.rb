class FileStoresController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @comment = Comment.find(params[:id])
    @file = @comment.file_stores.build(file_store_params)
    authorize! :create, @file
    if @file.save
      render 'file_stores/create.json.jbuilder'
    else
      render json: @file.errors, status: :unprocessable_entity
    end
  end

  private

    def file_store_params
      params.permit(:file, :file_name)
    end
end
