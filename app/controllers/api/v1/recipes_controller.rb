require 'byebug'

class Api::V1::RecipesController < ApplicationController
  def results
    # console.log("Cooking up the results of your query...")
    q = params[:q]
    
    query = q.downcase
    @recipes = makeFetchHappen(query)

    render json: @recipes
  end
  
  def index
    @recipes = Recipe.all
    render json: @recipes, include: :ingredients
  end

  def create
  end
end
