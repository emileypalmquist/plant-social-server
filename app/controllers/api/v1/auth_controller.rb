class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        user = User.find_by(username: user_login_params[:username])
        if user && user.authenticate(user_login_params[:password])
            # encode token comes from ApplicationController
            token = encode_token({ id: user.id })
            render json: { user: UserSerializer.new(user), jwt: token }, status: :accepted
        else
            render json: { messages: ['Invalid username or password'] }, status: :unauthorized
        end
    end

    def re_auth
        render json: { user: UserSerializer.new(current_user)}, status: :accepted
    end
    
    private
    
    def user_login_params
        params.require(:user).permit(:username, :password)
    end
end