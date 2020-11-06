class IngredientsController < ApplicationController
    skip_before_action :authorized, only: [:stock_pantry]
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

    def convert
        
        converted = Api.convert(convert_params)
        render json: converted
    end

    def my_ingredients
        
        ingredients = current_user.user_ingredients
        potluck_ingredients = current_user.supplied_ingredients
        my_results = ActiveModelSerializers::SerializableResource.new(ingredients)
        potluck_results = ActiveModelSerializers::SerializableResource.new(potluck_ingredients)
        
        render json: {my_ingredients: my_results, my_supplied_ingredients: potluck_results}
    end

    def stock_pantry
        frequent_ingredients = ["salt", "pepper", "flour", "granulated sugar", "brown sugar", "paprika", 
                "butter", "garlic", "onions", "tomato", "potato", "vegetable oil", "eggs",
                 "spaghetti", "bread", "hot sauce", "soy sauce", "rice", "baking powder", "baking soda"]
        ingredients = frequent_ingredients.map{|ing| Ingredient.find_by(name: ing)}
        render json: ingredients
    end

    private

    def pantry_params
        params.require(:pantry).permit(:spoon_id, :amount, :amount_type)
    end

    def convert_params
        params.require(:convert).permit(:amount, :toType, :fromType, :ingredient)
    end
end
