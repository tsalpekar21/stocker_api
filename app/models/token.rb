class Token < ActiveRecord::Base
  validates_presence_of :access_token, :expires, :user_id
  validates_uniqueness_of :access_token

  belongs_to :user

  default_scope { where(deleted_at: false) }

  def expired?
    self.expires < Time.now
  end
end
