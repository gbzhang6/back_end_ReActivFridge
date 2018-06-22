class Api::V1::UsersController < ApplicationController
  before_action :loginRequired, only: [:user_ingredients]
  before_action :userMatch, only: [:user_ingredients]
  
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new

    @user.name = params[:name]
    @user.email = params[:email]
    @user.username = params[:username]
    @user.password = params[:password]

    if (@user.save)

      payload = {
        username: @user.username,
        id: @user.id
      }

      token = JWT.encode payload, ENV['JWT_SECRET'], 'HS256'

      render json: {
        token: token
      }
    else
      render json: {
        errors: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def user_ingredients
    render json: @user.snacks
  end

  private
  def user_params
    # params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
