class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	protect_from_forgery with: :null_session
	 def google_oauth2
	 	byebug
        auth = request.env["omniauth.auth"]
        byebug
        @user = User.where(provider: auth["provider"], uid: auth["uid"])
                .first_or_initialize(email: auth["info"]["email"])
        @user.name ||= auth["info"]["name"]
        @user.image = auth["info"]["image"]
        @user.password = SecureRandom.urlsafe_base64
        byebug
        @user.save!
        UserMailer.welcome_email(@user).deliver_now

        @user.remember_me = true
        sign_in(:user, @user)

        redirect_to after_sign_in_path_for(@user)
    end
 

  def failure

    redirect_to root_path
  end
end