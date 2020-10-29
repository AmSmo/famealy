class IngredientsController < ApplicationController

    def find_ingredient
        results = Api.ingredient_search(params[:ingredient])
    end

    def add_to_pantry
        
    end

    private

    def pantry_params
        params.require(:pantry).permit(:spoon_id, :amount, :amount_type)
    end
end
