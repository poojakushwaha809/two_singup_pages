class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
        auth = request.env["omniauth.auth"]
        @user = User.where(provider: auth["provider"], uid: auth["uid"])
                .first_or_initialize(email: auth["info"]["email"])
        @user.name ||= auth["info"]["name"]
        @user.image = auth["info"]["image"]

        @user.remember_me = true
        sign_in(:user, @user)

        redirect_to student_new_path(@user)
  end

  def failure
    redirect_to root_path
  end
end