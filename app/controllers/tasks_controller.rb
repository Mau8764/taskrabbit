class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :show, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)

    if @task.save
      redirect_to @task
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @task.update(tasks_params)
      redirect_to @task
    else
      render "edit"
    end
  end

  def destroy
    @task.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :description, :company, :url)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
