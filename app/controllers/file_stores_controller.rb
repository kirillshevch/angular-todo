class FileStoresController < ApplicationController
  def create
    @comment = Comment.find(params[:id])
    @file = @comment.file_stores.build(file_store_params)
    if @file.save
      render 'file_stores/create.json.jbuilder'
    end
  end

  private

    def file_store_params
      params.permit(:file, :file_name)
    end
end
