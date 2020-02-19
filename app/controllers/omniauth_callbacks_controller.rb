class OmniauthCallbacksController < ApplicationController
    

    def google_oauth2
        auth = request.env["omniauth.auth"]
        @user = User.where(provider: auth["provider"], uid: auth["uid"])
                .first_or_initialize(email: auth["info"]["email"])
        @user.name ||= auth["info"]["name"]
        @user.image = auth["info"]["image"]
        @user.password = SecureRandom.urlsafe_base64
        @user.save!
        UserMailer.welcome_email(@user).deliver_now

        @user.remember_me = true
        sign_in(:user, @user)

        redirect_to after_sign_in_path_for(@user)
    end

    
    def failure
        redirect_to root_path
    end
   # def create_session
   #     auth = request.env['omniauth.auth']
   #     user = User.find_by_provider_and_uid(auth['provider'], auth['uid'])    
   #     session[:user_id] = user.id
   #     redirect_to root_url, notice: 'Signed in!'
   # end
end
