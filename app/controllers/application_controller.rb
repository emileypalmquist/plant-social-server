class ApplicationController < ActionController::API
    before_action :authorized
 
    SECRET = ENV['jwt_secret']
    # ALGO = ENV['algo']


    def encode_token(payload)
        # should store secret in env variable
        JWT.encode(payload, SECRET)
    end
    
    def auth_header
        # { Authorization: 'Bearer <token>' }
        request.headers['Authorization']
    end
    
    def decoded_token
        if auth_header
        token = auth_header.split(' ')[1]
        # header: { 'Authorization': 'Bearer <token>' }
        begin
            # JWT.decode(token, SECRET, true, algorithm: ALGO)
            JWT.decode(token, SECRET, true)
        rescue JWT::DecodeError
            nil
        end
        end
    end
    
    def current_user
        if decoded_token
            user_id = decoded_token[0]['id']
            @user = User.includes(:favorite_plant_species, user_plants: [:care_notes]).find_by(id: user_id)
        end
    end
    
    def logged_in?
        !!current_user
    end
    
    def authorized
        render json: { messages: ['Please log in'] }, status: :unauthorized unless logged_in?
    end
end
