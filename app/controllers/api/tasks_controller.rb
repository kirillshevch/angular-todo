class Api::TasksController < ApplicationController
  load_resource :list
  load_resource :task, through: :list
  # TODO авторайзы!

  def create
    if @task.save(task_params)
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
      params.permit(:name, :completed, :due_date)
    end
end