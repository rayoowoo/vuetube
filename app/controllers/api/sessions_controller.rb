class Api::SessionsController < ApplicationController

    def create 
        @user = User.find_by_credentials(
            params[:username],
            params[:password]
        )
        if @user
            login!(@user)
            render :show
        else
            attempted_user = User.find_by(username: params[:username])
            if attempted_user
                render json: ["wrong password", {attempted_username: params[:user][:username]}], status: 401
            else
                render json: ["username was not found"], status: 404
            end
        end
    end

    def destroy
        if !current_user
            render json: ['no user to logout'], status: 404
        end
        logout!
    end

end