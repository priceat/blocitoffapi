class ListsController < ApplicationController
  before_filter :authorize_admin!, :except => [:index, :show]

   def index
    @lists = current_user.lists
    @list = List.new
  end

 def show
    @list = List.find(params[:id])
    @tasks = @list.tasks
    @new_task = Task.new
 end
  
  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)


     if @list.save
       flash[:notice] = "List Saved. Get Crackin!"
       redirect_to @list
     else
       flash[:error] = "You lack the will of a List Warrior. Try again."
       render :new
     end
   end

  def edit
    @list = List.find(params[:id])
  end

  def update
     @list = List.find(params[:id])
     if @list.update_attributes(params.require(:list).permit(:title, :description))
       flash[:notice] = "List updated."
       redirect_to @list
     else
       flash[:error] = "There was an error saving the list. Please try again."
       render :edit
     end
   end


  def destroy
     @list = List.find(params[:id])
     title = @list.title
 
     if @list.destroy
       flash[:notice] = "\"#{title}\" was deleted successfully."
       redirect_to lists_path
     else
       flash[:error] = "There was an error deleting the list."
       render :show
     end
  end

   private

   def list_params
    params.require(:list).permit(:title, :description)
   end


end
