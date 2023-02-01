class Api::UsersController < ApplicationController
  def create
    email = params.require(:email)
    username = params.require(:username)
    password = params.require(:password)

    @user = User.new(email: email, username: username, password: password)

    if @user.save
      login!(@user)
      render json: {user: @user}
    else
      render json: { errors: @user.errors.full_messages} , status: :unprocessable_entity
    end

  end

  private

  def user_params
    params.permit(:email, :username, :password)
  end
end