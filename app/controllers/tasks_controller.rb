class TasksController < ApplicationController
    def index
      @tasks = Task.where(status: 'incomplete')
      @task = Task.new
    end
  
    def create
      @task = Task.new(task_params)
      if @task.save
        redirect_to tasks_path, notice: 'Task was successfully created.'
      else
        @tasks = Task.where(status: 'incomplete')
        render :index
      end
    end
  
    def complete
        @task = Task.find(params[:id])
        if @task.update(status: 'complete')
          redirect_to tasks_path, notice: 'Task marked as complete.'
        else
          redirect_to tasks_path, alert: 'Error marking task as complete.'
        end
    end
  
    private
  
    def task_params
      params.require(:task).permit(:name)
    end
  end
  