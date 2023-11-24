# frozen_string_literal: true

class ApplicationController < ActionController::Base
    helper_method :current_user, :all_users, :logged_in?
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
    def all_users
        if logged_in?
            @all_users ||= User.all
        end
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
  def current_user
    @current_user ||= User.find_by(user_email: session[:user_email]) if session[:user_token]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    return if logged_in?

    flash[:alert] = 'You must be logged in to perform that action.'
    redirect_to root_path
  end
end
