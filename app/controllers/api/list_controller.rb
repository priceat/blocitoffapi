class Api::ListsController < Api::BaseController
  
  before_action :authenticate
  before_filter :authorize_admin!, :except => [:index, :show]

  def index
    lists = List.all
    render json: lists, status: 200
  end

  def create
    list = List.new(params[:list])
    if list.save
      respond_with(list, :location => api_list_path(list))
    else
      respond_with(list)
    end
  end

 protected
    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        User.find_by(auth_token: token)
      end
    end

end