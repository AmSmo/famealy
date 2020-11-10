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
  post '/ingredients/eat/:id', to: 'ingredients#destroy'
  get '/recipes/random', to: 'recipes#random'
  post '/ingredients/convert', to: 'ingredients#convert'
  patch '/user_ingredient/:id', to: 'users#edit_pantry'
  patch '/supplied_ingredient/:id', to: 'potlucks#edit_pantry'
  post '/users/join_potluck', to: 'users#join_potluck'
  post '/users/leave_potluck', to: 'users#leave_potluck'
  post '/potlucks/bring_food', to: 'potlucks#bring_food'
  post '/potlucks/delete_food/:id', to: 'potlucks#delete_food'
  post '/potlucks/eat_ingredient/:id', to: 'potlucks#eat_ingredient'
  post '/potlucks/bring_ingredient', to: 'potlucks#bring_ingredient'
  post '/potlucks/bring_ingredient', to: 'potlucks#bring_ingredient'
  post '/users/unfriend', to: 'users#unfriend'
  get '/ingredients/frequent', to: 'ingredients#stock_pantry'
  post '/ingredients/bulk_add', to: 'ingredients#bulk_add'
  post '/potluck/change_recipe_time/:id', to: 'potlucks#change_recipe_time'
  resources :trips
  resources :potlucks do
    get :photo, on: :member
  end
  resources :ingredients
  resources :recipes
  resources :users do
    get :profile, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
