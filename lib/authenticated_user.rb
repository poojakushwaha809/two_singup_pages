class AuthenticatedUser
  def self.matches?(request)
    user_signed_in?
  end
end