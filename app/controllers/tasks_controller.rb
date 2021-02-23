class TasksController < ApplicationController
  before_action :set_tasks, only: %i[index show]
  before_action :set_task, only: %i[edit update destroy]
  def index; end

  def new
    @task = Task.new # needed to instantiate the form_for
  end

  def create
    @task = Task.new(task_params)
    @task.save

    # no need for app/views/tasks/create.html.erb
    redirect_to task_path(@task)
  end

  def show
    @task = @tasks.find(params[:id])
  end

  def edit; end

  def update
    @task.update(task_params)

    # no need for app/views/tasks/update.html.erb
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy

    # no need for app/views/tasks/destroy.html.erb
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end

  def set_tasks
    @tasks = Task.all
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
