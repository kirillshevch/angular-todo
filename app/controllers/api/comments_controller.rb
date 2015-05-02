class Api::CommentsController < ApplicationController
  load_and_authorize_resource only: [:destroy]

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:task_id])
    @comment = @task.comments.build(comment_params)
    authorize! :create, @comment

    if @comment.save
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @comment.destroy
      render nothing: true
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

    def comment_params
      params.permit(:name, :files)
    end
end