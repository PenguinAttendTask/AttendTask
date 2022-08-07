class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    task = Task.new(task_params)
    task.save!
    redirect_to tasks_url, notice: "「#{task.name}さん」が出勤しました。"
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "「#{task.name}さん」に修正しました。"
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "「#{task.name}さん」を退勤させました。"
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
