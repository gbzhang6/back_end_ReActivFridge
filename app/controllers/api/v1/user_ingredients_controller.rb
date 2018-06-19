class Api::V1::UserIngredientsController < ApplicationController
  def index
    @user_ingredients = UserIngredient.all
    render json: @user_ingredients
  end

  def create
  end
end
