class UserService

  def create(user_params)
    user = User.create(user_params)
    UserPresenter.new(user)
  end

end
