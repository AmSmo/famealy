Rails.application.routes.draw do
  get '/recipes/spoon/:spoon_id', to: 'recipes#spoon'
  get '/recipe_search/:keyword', to: "recipes#search"
  get '/auth', to: 'users#auth'
  get '/my_info', to: 'users#user_info'
  post '/login', to: 'users#login'
  post '/users/add_recipe', to: 'users#add_recipe'
  delete '/user_recipes/:id', to: 'users#delete_recipe'
  resources :trips
  resources :potlucks
  resources :ingredients
  resources :recipes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
