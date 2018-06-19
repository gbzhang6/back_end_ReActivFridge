class Api::V1::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render json: @recipes, include: :ingredients
  end

  def create
  end
end
