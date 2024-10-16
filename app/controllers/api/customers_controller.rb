module Api
  class CustomersController < ApplicationController
    def index
      customers = Customer.all
      render json: CustomerSerializer.new(customers), status: :ok
    end
  end
end