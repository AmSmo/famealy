Rails.application.routes.draw do
  get '/recipes/spoon/:spoon_id', to: 'recipes#spoon'
  get '/recipe_search/:keyword', to: "recipes#search"

  resources :trips
  resources :potlucks
  resources :ingredients
  resources :recipes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
