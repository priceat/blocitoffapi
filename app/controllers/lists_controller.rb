class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params.require(:list).permit(:title, :body))
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
     if @list.update_attributes(params.require(:list).permit(:title, :body))
       flash[:notice] = "List updated."
       redirect_to @list
     else
       flash[:error] = "There was an error saving the list. Please try again."
       render :edit
     end
   end
end
