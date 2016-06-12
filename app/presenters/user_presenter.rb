class UserPresenter < BasePresenter
  def created_user
    user = result.attributes.slice('id', 'first_name', 'last_name', 'email', 'token')
    { user: user }
  end

  def token_and_user
    token = result[:token].slice('access_token', 'expires')
    user = result[:user].slice('id', 'first_name', 'last_name', 'email')
    { user: user.merge(token) }
  end
end
