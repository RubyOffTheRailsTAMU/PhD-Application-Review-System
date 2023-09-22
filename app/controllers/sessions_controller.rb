class SessionsController < ApplicationController
    def create
        auth = request.env['omniauth.auth']
        session[:user_token] = auth.credentials.token
        session[:user_email] = auth.info.email
        
        user = User.find_by(email: email)
      
        if user.nil?
            redirect_to new_user_path, alert: 'Create an account before signing in with Google'
        else
            redirect_to root_path
      end
    
      def destroy
        reset_session
        redirect_to root_path
      end
end
