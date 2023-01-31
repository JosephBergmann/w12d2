class Api::SessionsController < ApplicationController
  def show
    if current_user
      render json: {user: current_user}
    else
      render json: {user: nil}
    end
  end

  def create

    debugger
    @user = User.find_by_credentials(user_params)

    if @user
      login!(@user)
      render json: {user: @user}
    else
      render json: {error: 'Invalid credentials'}, status: :unauthorized
    end

  end

  def destroy
    if @user
      logout!
      render json: {message: 'success!'}
    end
  end

  private
  def user_params
    params.require(:user).permit(:credential, :password)
  end
end
