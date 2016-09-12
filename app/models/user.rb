class User < ActiveRecord::Base
  enum role: {admin: 1, client: 2}

  has_secure_password
  has_many :boards, dependent: :destroy

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_uniqueness_of :email

end
