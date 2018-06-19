require 'byebug'
require 'rest-client'

Ingredient.delete_all
UserIngredient.delete_all


User.create(name: "GBZ", email: "gbz@gmail.com", password: "gbz123")

ingredients = ['lime', 'apple', 'tortilla', 'pork', 'onion', 'pepper', 'salt', 'avocado', 'pasta', 'garlic', 'cheese']
ingredients.each {|item| 
    Ingredient.create(name: item, imgUrl:"https://www.themealdb.com/images/ingredients/#{item}.png")
}

# RestClient.get()

Ingredient.all.each {|i| UserIngredient.create(user_id:1, ingredient_id: i.id)}