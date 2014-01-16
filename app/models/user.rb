class User < ActiveRecord::Base
  has_secure_password
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

  before_create :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, presence: true, 
                      length: {maximum: 30}, 
                      uniqueness: { case_sensitive: false } # is this redundant with line 12?
  validates :email, presence: true, 
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6}


  private

  def create_remember_token
    self.remember_token = User.encrypt(new_remember_token)
  end

end
