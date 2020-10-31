class IngredientsController < ApplicationController

    def find_ingredient
        results = Api.ingredient_search(params[:ingredient])
       byebug
        current_ingredient = Ingredient.find_by(spoon_id: results[0]["id"])
        if current_ingredient
            render json: current_ingredient, status: :accepted
        else
            current_ingredient = Ingredient.create(name: results[0]["name"], spoon_id: results[0]["id"])
            render json: current_ingredient
        end
    end

    def my_ingredients
        ingredients = current_user.ingredients
        render json: ingredients
    end

    def add_to_pantry
        
    end

    private

    def pantry_params
        params.require(:pantry).permit(:spoon_id, :amount, :amount_type)
    end
end
