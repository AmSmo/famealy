Rails.application.routes.draw do
  resources :trips
  resources :potlucks
  resources :ingredients
  resources :recipes
  resources :users
  get '/recipe_search/:keyword', to: "recipes#search"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
