class ListsController < ApplicationController
  def index
    @lists = current_user.lists
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks.paginate(page: params[:page], per_page: 10)
    
    unless @list.user == current_user
      redirect_to root_path, alert: 'Unauthorized'
    end
    
  end
  
  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(params.require(:list).permit(:title, :description))
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

   private

   def list_params
    params.require(:list).permit(:title, :description)
   end


end
