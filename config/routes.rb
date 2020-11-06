Rails.application.routes.draw do
  get '/recipes/spoon/:spoon_id', to: 'recipes#spoon'
  get '/recipe_search/:keyword', to: "recipes#search"
  get '/ingredient_search/:ingredient', to: "ingredients#find_ingredient"
  post '/user_search', to: "users#search"
  get '/auth', to: 'users#auth'
  get '/my_info', to: 'users#user_info'
  get '/users/friends', to: 'users#friends'
  post '/users/add_friend', to: 'users#add_friend'
  post '/login', to: 'users#login'
  post '/users/add_recipe', to: 'users#add_recipe'
  delete '/user_recipes/:id', to: 'users#delete_recipe'
  get '/users/ingredients', to: 'ingredients#my_ingredients'
  post '/users/add_pantry', to: 'users#add_pantry'
  
  get '/recipes/random', to: 'recipes#random'
  post '/ingredients/convert', to: 'ingredients#convert'
  patch '/user_ingredient/:id', to: 'users#edit_pantry'
  post '/users/join_potluck', to: 'users#join_potluck'
  post '/users/leave_potluck', to: 'users#leave_potluck'
  post '/potlucks/bring_food', to: 'potlucks#bring_food'
  post '/potlucks/bring_ingredient', to: 'potlucks#bring_ingredient'
  post '/users/unfriend', to: 'users#unfriend'
  get '/ingredients/frequent', to: 'ingredients#stock_pantry'
  resources :trips
  resources :potlucks
  resources :ingredients
  resources :recipes
  resources :users do
    get :profile_pic, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
