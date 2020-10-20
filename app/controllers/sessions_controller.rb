class SessionsController < ApplicationController
    include CurrentUserConcern

    def create
        user = User
        .find_by(email: params["user"]["email"])
        .try(:authenticate, params["user"]["password"])

        if user
            session[:user_id] = user.id
            render json: {
                status: :created,
                logged_in: true,
                user: {user: user, ingredients: user.ingredients}
            }
        else
            render json: { status: 401 }
        end
    end

    def logged_in
    #checks to see if a user is logged in or not
        if @current_user
            render json: {
                logged_in: true,
                user: @current_user
            }
        else
            render json: {
                logged: false
            }
        end
    end

    def logout
        reset_session
        render json: { status: 200, logged_out: true}
    end

end

