class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
        render json: @recipes
    end
    
    def search        
        recipes = Api.recipe_search(params[:keyword])
        render json: recipes, status: :accepted
    end

    def spoon
        recipe = Recipe.find_by(spoon_id: params[:spoon_id])
        if recipe
            render json: recipe
        else
            recipe = Api.recipe_detail(params[:spoon_id])
            
            current_recipe = Recipe.create(spoon_id:recipe[:spoon_id], 
                        image_url: recipe[:image_url],
                        name: recipe[:name],
                        description: recipe[:description], 
                        time: recipe[:time],
                        cost: recipe[:cost],
                        directions_json: recipe[:directions_json],
                        directions: recipe[:directions],
                        )
            recipe[:ingredients].each do |ingredient|
                current_ingredient = Ingredient.find_or_create_by(spoon_id: ingredient["id"], name: ingredient["name"])
                
                RecipeIngredient.create(recipe: current_recipe, ingredient: current_ingredient, amount: ingredient["measures"]["us"]["amount"], amount_type: ingredient["measures"]["us"]["unitShort"], description: ingredient["original"] )
            end

           render json: current_recipe, status: :accepted
        end
        

    end
end
