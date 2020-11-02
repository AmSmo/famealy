class UsersController < ApplicationController
     skip_before_action :authorized, only: [:create, :login, :auth]

    def create
      
        @user = User.create(user_params)
        if @user.valid?
            token = encode_token({user_id: @user.id})
            render json: { user: @user, jwt: token}, status: :accepted
        else
            render json: { message: 'failed to create user' }, status: :not_acceptable
        end
    end

    def show
      @user = User.find_by(id: params[:id])
      render json: @user
    end
 
    def friends
      friends = current_user.friends
      render json: friends
    end

    def add_friend
      friend = User.find_by(id: params[:friendId])
      already = current_user.friends.include?(friend)
      
      if !already
        
        UserUser.create(user: current_user, friend: friend)
        UserUser.create(friend: current_user, user: friend)
      end
      
      friends = current_user.friends
      render json: friends
    end

    def auth
      if current_user == nil
        render json:{user: {
          username: "",
          name: "",
          location: "",
          email_address: ""
        }}
      else
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
      end
    end

    def login
      @user= User.find_by(username: login_params[:username])

      if @user && @user.authenticate(login_params[:password])        
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
    
    def search
  
      type = params[:type]

      if type == "name"
        results = User.where('lower(name) LIKE ?', "%#{params[:query].downcase}%").where.not(id: current_user.id)
      elsif type == "email"
        results = User.where('lower(email_address) LIKE ?', "%#{params[:query].downcase}%").where.not(id: current_user.id)
      elsif type == "username"
        results =User.where('lower(username) LIKE ?', "%#{params[:query].downcase}%").where.not(id: current_user.id)
      end
      render json: results
    end
    def pertinent
      
      recipes = current_user.recipes
      potlucks = current_user.potlucks
      ingredients = current_user.ingredients
      return {recipes: ActiveModelSerializers::SerializableResource.new(recipes), potlucks: potlucks, ingredients: ingredients}
    end
    def add_pantry
      ingredient = Ingredient.find_by(spoon_id: pantry_id[:ingredient_id].to_i)
      current_user_ingredient = UserIngredient.find_by(user: current_user, ingredient: ingredient)
      if current_user_ingredient
        
        if params["pantry"]["amount_type"] == current_user_ingredient.amount_type
          
          new_amount = params["pantry"]["amount"].to_f + current_user_ingredient.amount
          current_user_ingredient.update(amount: new_amount)
        end
      else
        current_user_ingredient = UserIngredient.create(user_id: current_user.id, ingredient: ingredient)
        current_user_ingredient.update(pantry_params)
      end

      user_ingredients = current_user.user_ingredients
      render json: user_ingredients
    end

    def user_info
      user_details = pertinent
      render json: user_details, status: :accepted
    end

    private

    def login_params
      params.require(:user).permit(:username, :password)

    end

    def user_params
      params.permit(:username, :password, :location, :email_address, :name, :profile_pic)
    end

    def pantry_id
      params.require(:other_info).permit(:ingredient_id)
    end
    def pantry_params
      params.require(:pantry).permit(:amount_type, :amount)
    end
end
