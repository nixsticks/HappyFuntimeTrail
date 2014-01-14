class User < ActiveRecord::Base
  has_many :created_trails,
    class_name: 'Trail',
    foreign_key: 'creator_id'
  has_many :trail_followers,
    foreign_key: 'follower_id'
  has_many :followed_trails,
    source: :trail,
    through: :trail_followers

  before_save { self.email = email.downcase }  
  before_save { self.username = username.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, presence: true, length: {maximum: 30}, uniqueness: true
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
end
