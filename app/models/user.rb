class User < ActiveRecord::Base
  has_secure_password

  validates :username, uniqueness: true
  validates :title, presence: true
  validates :username, :password, presence: true

end
