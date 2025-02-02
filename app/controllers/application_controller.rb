class ApplicationController < ActionController::API
  def authenticate_api_request!
    render(json: { message: 'unauthorized request' }, status: :unauthorized) unless authorized_request?
  end

  def authorized_request?
    jwt_decoded = JWT.decode jwt_token, ENV['JWT_SECRET_KEY'], true, { algorithm: 'HS256' }
    user(jwt_decoded)
  rescue StandardError
    false
  end

  def user(jwt_decoded)
    User.find_by(id: jwt_decoded.first['id'])
  end

  def jwt_token
    request.headers['Authorization'].split(' ').last
  end

end
