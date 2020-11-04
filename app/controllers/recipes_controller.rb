class RecipesController < ApplicationController
    allowed_types = ["oz", "cup", "g", "tbsp", "tsp", "lb", "kg"]
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
            allowed_types = ["oz", "cup", "g", "tbsp", "tsp", "lb", "kg", "large", "medium", "small", "slice", "can", "clove"]
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
                

                
                current_ingredient = Ingredient.find_by(spoon_id: ingredient["id"])
                if !current_ingredient
                    results = Api.ingredient_search(ingredient["name"])
                    image_url = "https://spoonacular.com/cdn/ingredients_100x100/#{results[0]["image"]}"
                    units = []
                    if results[0]["possibleUnits"]
                        results[0]["possibleUnits"].map do |ing| 
                            units << "tbsp" if ing == "tablespoon"
                            units << "tsp" if ing == "teaspoon"
                            units << ing if allowed_types.include?(ing)
                        end
                    end
                    spoon_amount = Recipe.translate_amount(ingredient["measures"]["us"]["unitShort"])
                
                    current_ingredient = Ingredient.create(name: ingredient["name"], spoon_id: ingredient["id"], image_url: image_url, possible_units: units)
                end
                RecipeIngredient.create(recipe: current_recipe, ingredient: current_ingredient, amount: ingredient["measures"]["us"]["amount"], amount_type: spoon_amount, description: ingredient["original"] )
            end

           render json: current_recipe, status: :accepted
        end
        
        
    end

        def random
            recipe = Api.random
            
            render json: recipe
        end
end
