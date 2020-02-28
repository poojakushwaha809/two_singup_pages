# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]
   protect_from_forgery with: :null_session
   def google_oauth2
    
        auth = request.env["omniauth.auth"]
        
        @user = User.where(provider: auth["provider"], uid: auth["uid"])
                .first_or_initialize(email: auth["info"]["email"])
        @user.name ||= auth["info"]["name"]
        @user.image = auth["info"]["image"]
        @user.password = SecureRandom.urlsafe_base64
        
        @user.save!
        # UserMailer.welcome_email(@user).deliver_now

        @user.remember_me = true
        sign_in(:user, @user)

        redirect_to after_sign_in_path_for(@user)
    end
 

  def failure

    redirect_to root_path
  end

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end


  
end
