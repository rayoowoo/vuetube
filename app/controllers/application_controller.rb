class ApplicationController < ActionController::Base
    protect_from_forgery prepend: true, with: :exception
    skip_before_action :verify_authenticity_token
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def ensure_logged_in
        render json: ["you are not logged in"], status: 401 unless logged_in?
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end

    def logout!
        current_user.reset_session_token!
        @current_user = nil
        session[:session_token] = nil
    end
end
