class Lists::TasksController < ApplicationController
  respond_to :html, :js
  def create
    
    @list = List.find(params[:list_id])
    @task = @list.tasks

    @task = current_user.tasks.build( task_params )
    @new_task = Task.new

    if @task.save
      flash[:notice] = "New Task."
    else
      flash[:error] = "Nothing saved. Try again."

    respond_with(@task) do |format|
      format.html { redirect_to [@list.task, @list] }
    end
  end

  end

  def new
    @list = List.find(params[:list_id])
    @task = Task.new
  end

  def show
    @list = List.find(params[:list_id])
    @tasks = @list.tasks
  end

  def edit
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
  end

  def update
     @list = List.find(params[:list_id])
     @task = Task.find(params[:id])
    
    if @task.update_attributes(task_params)
      flash[:notice] = "Task updated. Get back to work!"
      redirect_to [@list]
    else
      flash[:error] = "No can do, partner. Try again."
      render :edit
    end
  end


  private

    def task_params
      params.require(:task).permit(:title, :body)
    end
end
