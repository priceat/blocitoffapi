class Api::BaseController < ActionController::Base
  
  before_filter :authenticate_user
  skip_before_action :verify_authenticity_token

  # necessary in all controllers that will respond with JSON
  respond_to :json, :xml

  private

    def authenticate_user
      @current_user = User.find_by_authentication_token(params[:token])
      unless @current_user
        respond_with({:error => "Token is invalid."})
      end
    end

    def current_user
      @current_user
    end

  # Error responses and before_action blocking work differently with Javascript requests.
  # Rather than using before_actions to authenticate actions, we suggest using
  # "guard clauses" like `permission_denied_error unless condition`
  #def permission_denied_error
   # error(403, 'Permission Denied!')
  #end

  #def error(status, message = 'Something went wrong')
   # response = {
    #  response_type: "ERROR",
     # message: message
    #}

    #render json: response.to_json, status: status
  #end

end