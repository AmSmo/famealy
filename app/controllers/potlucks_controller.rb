class PotlucksController < ApplicationController
    skip_before_action :authorized

    def index
        my_potlucks = current_user.potlucks
        friends_potlucks = current_user.friends.map(&:potlucks).select{|val| val != []}
        fixed = friends_potlucks.map do |friends|
            friends.reject do |potluck|
                my_potlucks.include?(potluck)
            end
        end.flatten.uniq
        if !fixed
            fixed = []
        end
        
        render json: {my_potlucks: my_potlucks, friends_potlucks:fixed}
    end


    def edit_pantry
      
      ingredient = SuppliedIngredient.find_by(id: params[:id])
      ingredient.update!(update_params)
      
      
      

        render json: ingredient
    end

    def eat_ingredient
        
        current_supplied = SuppliedIngredient.find_by(id: params[:id])
        current_potluck = current_supplied.potluck
        current_supplied.destroy
        render json: current_potluck

    end

    def bring_food
        recipe = Recipe.find_by(spoon_id: bringing_params[:recipe])
        current_potluck = Potluck.find_by(id: bringing_params[:potluck_id])
        success = PotluckRecipe.create(recipe: recipe, user: current_user, potluck: current_potluck )
        
        render json: current_potluck
    end

    def create
        current_potluck = Potluck.create(potluck_params)
        UserPotluck.create(potluck: current_potluck, user: current_user)
        index
    end

    def show
        current_potluck = Potluck.find_by(id: params[:id])
        render json: current_potluck
    end

    def bring_ingredient
        current_ingredient = Ingredient.find_by(spoon_id:(ingredient_params[:spoon_id]))
  
        proper_amount = ingredient_params[:amount].to_f
        current_supply = SuppliedIngredient.find_or_create_by(ingredient: current_ingredient, user: current_user, potluck_id: ingredient_params[:potId], amount: proper_amount , amount_type: ingredient_params[:amount_type] )

        render json: current_supply
    end

    def change_recipe_time
    
        current_recipe = PotluckRecipe.find_by(id: params[:id])
        if time_params[:time]
            time_object = Time.parse(time_params[:time])
        else
            time_object = nil
        end
        current_recipe.update(start_time: time_object)
        render json: current_recipe
    end

    private

    def time_params
        params.require(:potluck_recipe).permit(:time)
    end
    def ingredient_params
        params.require(:ingredients).permit(:amount, :spoon_id, :amount_type, :potId)
    end
    def bringing_params
        params.require(:bringing).permit(:potluck_id, :recipe)
    end

    def potluck_params
        params.require(:potluck).permit(:name, :location, :date)
    end

     def update_params
      params.require(:update).permit(:amount, :amount_type)
    end
end
