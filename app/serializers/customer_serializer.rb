class CustomerSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :address
end
