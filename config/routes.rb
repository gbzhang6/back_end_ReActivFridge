Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :ingredients, only: [:index, :create]
      resources :users, only: [:index, :create]
      resources :user_ingredients, only: [:index, :show, :create]
      resources :recipes, only: [:index, :show, :create]
      resources :ingredient_recipes, only: [:index, :show, :create]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
