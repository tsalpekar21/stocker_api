class UserService

  def create(user_params)
    user = User.create(user_params)
    UserPresenter.new(user)
  end

  def update(id, user_params)
    user = User.find(id)
    user.update(user_params)
  end

end
