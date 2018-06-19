class RecipeSerializer < ActiveModel::Serializer
  attributes :name, :description, :imgUrl, :totalTimeInSeconds, :rating, :numberOfServings
end
