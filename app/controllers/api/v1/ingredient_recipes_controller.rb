class Api::V1::IngredientRecipesController < ApplicationController
  def index
    @ingredient_recipes = IngredientRecipe.all
    render json: @ingredient_recipes
  end

  def create
  end
end
