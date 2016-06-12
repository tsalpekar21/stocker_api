class User < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email
  before_save :build_token #activerecord build token

  has_secure_password
  has_one :token

  def refresh_token
    self.token = self.token.generate_access_token
  end

end
