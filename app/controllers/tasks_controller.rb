class TasksController < ApplicationController
  respond_to :html, :js
  
  def show
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
  end

  def new
    @list = List.find(params[:list_id])
    @task = Task.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks
    @task = current_user.tasks.build(task_params)
    @task.list = @list
    @new_task = Task.new
    
    if @task.save
      flash[:notice] = "New Task."
      #redirect_to [@list, @tasks]
    else
      flash[:error] = "Nothing saved. Try again."
      #render :edit
    end

      respond_with(@task) do |format|
       format.html { redirect_to @list }
     end
  end


  def edit
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
  end

  def update
    #change the overdue boolean logic to false
     @list = List.find(params[:list_id])
     @task = Task.find(params[:id])
    

    if  @task.update_attributes(task_params)
      flash[:notice] = "Task updated. Get back to work!"
      redirect_to [@list]
    else
      flash[:error] = "No can do, partner. Try again."
      render :edit
    end
  end

 def destroy
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    
    if @task.destroy
      flash[:notice] = "One down. More to go."
      #redirect_to @list
    else
      flash[:error] = "Not done yet son."
      #redirect_to @task
    end
     
      respond_with(@task) do |format|
       format.html { redirect_to @list }
     end
  end



  private

    def task_params
      params.require(:task).permit(:title, :body)
    end
end