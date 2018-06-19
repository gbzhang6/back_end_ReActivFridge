require 'byebug'
require 'rest-client'
require 'json'

Ingredient.delete_all
UserIngredient.delete_all
User.delete_all

User.create(name: "GBZ", email: "gbz@gmail.com", password: "gbz123")
#temporarily make Gui the only user

def imgUrl(imgObj)
    name = imgObj["strIngredient"].gsub(" ", "%20")
    return "https://www.themealdb.com/images/ingredients/#{name}.png"
end

res = RestClient.get 'https://www.themealdb.com/api/json/v1/1/list.php?i=list', {accept: :json}
data = JSON.parse(res)
data["meals"].each {|item|
    Ingredient.create(name: item["strIngredient"], imgUrl: imgUrl(item))
}

Ingredient.all.each {|i| UserIngredient.create(user_id: 1, ingredient_id: i.id)}
#temporarily assign all ingredients to Gui