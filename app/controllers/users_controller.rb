class UsersController < ApplicationController
    def show
        user = User.find(session[:user_id])
        if user
            render json: user
        else
            render json: { error: "Not authorized" }, status: :unauthorized
        end

    end
    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end
    private
    def user_params
        params.permit(:username, :password)
    end
end
