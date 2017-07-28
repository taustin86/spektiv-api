class ApplicationController < ActionController::API
  before_action :validate_api_key

  def validate_api_key
    #TODO Full authentication and authorization of API key
    api_key = (request.headers['Authorization'] || '').gsub(/\AAPIKEY /, '')
    if AuthorizedApplication.find_by_api_key(api_key).nil?
      render json: {status: :unauthorized}
    end
  end
end
