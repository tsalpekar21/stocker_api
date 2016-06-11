class UserPresenter
  attr_reader :user, :errors

  def initialize(user)
    @user = user
    @errors = user.errors.messages
  end

  def successful?
    errors.empty?
  end

  def jsonify
    user = @user.attributes.slice('id', 'first_name', 'last_name', 'email')
  end

end
