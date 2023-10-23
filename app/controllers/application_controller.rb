class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    if Rails.env.test?
        before_action :stub_current_user
        def stub_current_user
            session[:user_email] = cookies[:stub_user_email] if cookies[:stub_user_email]
            session[:user_token] = cookies[:stub_user_token] if cookies[:stub_user_token]
        end
    end
    def current_user
        @current_user ||= User.find_by(user_email: session[:user_email]) if session[:user_token]
    end
    def logged_in?
        !!current_user
    end
    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action."
            redirect_to root_path
        end
    end
end
