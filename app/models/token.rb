class Token < ActiveRecord::Base
  validates_uniqueness_of :access_token

  before_create :generate_access_token
  belongs_to :user

  default_scope { where(deleted_at: false) }

  def expired?
    self.expires < Time.now
  end

  def generate_access_token
    begin
      self.access_token = SecureRandom.uuid.gsub(/\-/,'')
    end while self.class.exists?(access_token: access_token)
    self.expires = Time.now + 2.days
  end

end
