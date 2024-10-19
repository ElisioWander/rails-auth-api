class UserSerializer
  include JSONAPI::Serializer
  attributes :email
  attributes :jwt_token do |obj|
    JWT.encode(
      { email: obj.email, id: obj.id, exp: Time.now.to_i + 1000 },
      ENV['JWT_SECRET_KEY'], 'HS256'
    )
  end
end
