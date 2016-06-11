class UserPresenter
  attr_reader :user, :errors

  def initialize(user)
    @user = user
    @errors = user.errors
  end

  def successful?
    errors.messages.empty?
  end

  def jsonify
    user = @user.attributes.slice('id', 'first_name', 'last_name', 'email')
  end

end
