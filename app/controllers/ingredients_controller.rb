class IngredientsController < ApplicationController
    allowed_types = ["oz", "cup", "g", "tbsp", "tsp", "lb", "kg"]
    def find_ingredient
        results = Api.ingredient_search(params[:ingredient])
       if results[0]["id"] == nil
        render json: {message: "Nothing Found"}
       else
        current_ingredient = Ingredient.find_by(spoon_id: results[0]["id"])
        if current_ingredient
            render json: current_ingredient, status: :accepted
            else
                byebug
                allowed_types = ["oz", "cup", "g", "tbsp", "tsp", "lb", "kg", "large", "medium", "small", "can", "clove"]
                units = []
                results[0]["possibleUnits"].map do |ing| 
                    units << "tbsp" if ing == "tablespoon"
                    units << "tsp" if ing == "teaspoon"
                    units << ing if allowed_types.include?(ing)
                end
                image_url = "https://spoonacular.com/cdn/ingredients_100x100/#{results[0]["image"]}"
                current_ingredient = Ingredient.create(name: results[0]["name"], spoon_id: results[0]["id"], image_url: image_url, possible_units: units)
                render json: current_ingredient
            end
        end
    end

    def my_ingredients
        
        ingredients = current_user.user_ingredients
        render json: ingredients
    end

    def add_to_pantry
        
    end

    private

    def pantry_params
        params.require(:pantry).permit(:spoon_id, :amount, :amount_type)
    end
end
