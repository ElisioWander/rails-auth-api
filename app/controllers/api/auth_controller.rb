module Api
  class AuthController < ApplicationController
    def registration
      user = User.new(user_params)
      if user.save
        render json: UserSerializer.new(user), status: :created
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end

    def login
      user = User.find_by(email: user_params[:email])
      if user&.valid_password?(user_params[:password])
        render json: UserSerializer.new(user), status: :ok
      else
        render json: { error: 'Invalid email or password!' }, status: :unauthorized
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end