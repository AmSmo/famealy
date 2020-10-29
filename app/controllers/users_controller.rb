class UsersController < ApplicationController
    #  skip_before_action :authorized, only: [:create, :login]

    def create
        @user = User.create(user_params)
        byebug
        if @user.valid?
            token = encode_token({user_id: @user.id})
            render json: { user: @user, jwt: token}, status: :accepted
        else
            render json: { message: 'failed to create user' }, status: :not_acceptable
        end
    end
 
    def auth
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def login
      @user= User.find_by(username: user_params[:username])
      if @user && @user.authenticate(user_params[:password])        
        token = encode_token({user_id: @user.id})
        render json: { user: UserSerializer.new(@user), jwt: token}, status: :accepted        
      else
        render json: { message: 'Invalid username or password' }, status: :unauthorized
      end
    end

    def add_recipe
      
      current_recipe = Recipe.find_by(spoon_id: params[:spoon_id])
      UserRecipe.create(user: current_user, recipe: current_recipe)
      user_details = pertinent
      render json: user_details, status: :accepted
    end

    def delete_recipe
      
      current_recipe = UserRecipe.find_by(recipe_id: params[:id], user: current_user)
      current_recipe.destroy
      user_details = pertinent
      render json: user_details, status: :accepted
    end
    def pertinent
      recipes = current_user.recipes
      potlucks = current_user.potlucks
      ingredients = current_user.ingredients
      return {recipes: ActiveModelSerializers::SerializableResource.new(recipes), potlucks: potlucks, ingredients: ingredients}
    end
    def user_info
      user_details = pertinent
      render json: user_details, status: :accepted
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :location, :email_address, :name)
    end
end
