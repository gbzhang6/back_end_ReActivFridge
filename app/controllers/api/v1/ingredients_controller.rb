class Api::V1::IngredientsController < ApplicationController  
  before_action :loginRequired, only: [:index]

  def index
    render json: Ingredient.all
  end

  def create
  end
end
