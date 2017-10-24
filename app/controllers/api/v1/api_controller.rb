class Api::V1::ApiController < ActionController::Base
  around_action :verify_token

  private

  def verify_token
    if request.headers['TOKEN'] == ENV['API_SECURE_TOKEN']
      yield
    else
      render json: { error: 'Please provide valid token'}, status: 401
    end
  end
end
