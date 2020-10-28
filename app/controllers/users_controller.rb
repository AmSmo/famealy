class UsersController < ApplicationController
    #  skip_before_action :authorized, only: [:create, :login]

    def create
        @user = User.create(user_params)
        
        if @user.valid?
          Gallery.create(user: @user)
            token = encode_token({user_id: @user.id})
            render json: { user: UserSerializer.new(@user), jwt: token}, status: :accepted
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end
 
    def auth
      render json: { user: UserSerializer.new(@user) }, status: :accepted
    end

    def login
      @user= User.find_by(username: user_params[:username])
      if @user.authenticate(user_params[:password])
        token = encode_token({user_id: @user.id})
        render json: { user: UserSerializer.new(@user), jwt: token}, status: :accepted
      else
        render json: { message: 'Invalid username or password' }, status: :unauthorized
      end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :location, :email, :name)
    end
end
