class RecipesController < ApplicationController
    def search
        
        recipes = Api.recipe_search(params[:keyword])
        byebug
        render json: recipes, status: :accepted
    end
end
