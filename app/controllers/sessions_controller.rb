class SessionsController < ApplicationController
    def read_emails(filename)
      emails = []
      File.open(filename, "r") do |file|
        file.each_line do |line|
          # Remove leading/trailing whitespace and add email to the array
          emails << line.strip
        end
      end
      emails
    end

    # Function to check if an email exists in the array
    def email_exists?(email_to_check, emails)
      emails.include?(email_to_check)
    end

    def create
      auth = request.env['omniauth.auth']

      emails = read_emails(Rails.root.join('app', 'assets', 'whitelist.txt').to_s)
      if email_exists?(auth.info.email, emails)
        session[:user_token] = auth.credentials.token
        session[:user_email] = auth.info.email
        # TODO: change this redirect to the user home page in the future
        # TODO: create/get User with this email and use that user from this point onwards

        jwtToken=JwtService.generate_jwt({user_email:session[:user_email]})
        session[:jwt_token] = jwtToken
        

        user = User.find_by(user_email: session[:user_email])
        if user
          redirect_to '/home'
        else
          redirect_to '/users/new'
        end
       
      else
        session[:user_email] = auth.info.email
        session[:alert] = 'This user is not allowed access to this site'
        redirect_to root_path
      end
      # user = User.find_by(email: email)

      # if user.nil?
      #     redirect_to new_user_path, alert: 'Create an account before signing in with Google'
      # else
      #     redirect_to root_path
      # end
    end

    def destroy
      reset_session
      redirect_to root_path
    end
end
