class UserMailer < ActionMailer::Base

  # default :from => "vijaywebintimate@gmail.com"
 
  def welcome_email(user)
    @user = user
    # @url  = "http://localhost:3000/users/sign_in"
    mail(to: @user.email, :subject => "Welcome to My Awesome Site")
  end
end
