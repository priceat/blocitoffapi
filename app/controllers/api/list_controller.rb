class API::ListsController < API::BaseController
  
  before_filter :authorize_admin!, :except => [:index, :show]

  def index
    respond_with(List.for(current_user).all)
  end

  def create
    list = List.new(params[:list])
    if list.save
      respond_with(list, :location => api_list_path(list))
    <co id="ch13_485_1"/>
    else
      respond_with(list)
    end
  end


end