module Api
  class CustomersController < ApplicationController
    before_action :authenticate_api_request!
    
    def index
      customers = Customer.all
      render json: CustomerSerializer.new(customers), status: :ok
    end
  end
end