class Api::TasksController < ApplicationController
  load_and_authorize_resource except: [:create]
  # todo обработка ошибок

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.build(task_params)
    authorize! :create, @task
    if @task.save
      render json: @task
    end
  end

  def update
    if @task.update(task_params)
      render nothing: true
    end
  end

  def destroy
    if @task.destroy
      render nothing: true
    end
  end

  private

    def task_params
      params.permit(:name, :completed, :due_date, :task_priority)
    end
end