module SignInHelper
  def sign_in_as(user)
    post session_url(params: { session: { email: user.email, password: 'P4ssword' } })
  end
end
