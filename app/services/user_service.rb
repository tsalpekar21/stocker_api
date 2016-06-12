class UserService
  attr_accessor :errors, :result

  def initialize
    @errors = []
    @result = {}
  end

  def successful?
    errors.empty?
  end

  def create(user_params)
    user = User.create(user_params)
    errors << user.errors.messages if user.errors.messages.any?
    result[:user] = user
    result[:token] = user.token
    UserPresenter.new(result)
  end

  def update(id, user_params)
    user = User.find(id)
    errors << user.errors.messages if user.errors.messages.any?
    user.update(user_params)
  end

  def authenticate(email, password)
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      result[:token] = user.refresh_token
      result[:user] = user
    else
      errors << 'Invalid email or password, try again.'
    end
    UserPresenter.new(result)
  end

end
