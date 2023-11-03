class WelcomeController < ApplicationController
    def create
        user = User.find_by(user_name: params[:session][:user_name])
        if user && params[:session][:user_name] == "admin" && user.authenticate(params[:session][:password])
            session[:user_token] = "admin_token_placeholder"
            session[:user_email] = user.user_email

            jwtToken=JwtService.generate_jwt({user_email:session[:user_email],
              exp: 24.hours.from_now.to_i})
            session[:jwt_token] = jwtToken
            
            current_user
            redirect_to '/home'
          else
            session[:alert] = "Wrong Admin Credentails"
            redirect_to root_path
          end
    end
end
