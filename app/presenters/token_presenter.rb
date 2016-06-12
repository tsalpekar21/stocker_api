class TokenPresenter < BasePresenter
  def token
    result.attributes.slice('access_token')
  end
end
