class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  has_many :created_trails,
    class_name: 'Trail',
    foreign_key: 'creator_id'
  has_many :trail_followers,
    foreign_key: 'follower_id'
  has_many :followed_trails,
    source: :trail,
    through: :trail_followers
  belongs_to :current_trail,
    class_name: 'Trail'
  belongs_to :current_pin,
    class_name: 'Pin'

  before_save { self.email = email.downcase }  
  before_save { self.username = username.downcase }
  before_create :create_remember_token

  before_create :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, presence: true, 
                      length: {maximum: 30}, 
                      uniqueness: { case_sensitive: false } # is this redundant with line 12?
  validates :email, presence: true, 
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6}


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def correct_location?(latitude, longitude)
    self.current_pin.latitude.round(0) == latitude.to_f.round(0) && self.current_pin.longitude.round(0) == longitude.to_f.round(0)
    #round lat/lng to 4th decimal place so user can be within a radius of the correct location.
  end

  def start(trail)
    update_attribute(:current_trail_id, trail.id) && update_attribute(:current_pin_id, trail.pins.first.id)
  end

  def stop_trail
    update_attribute(:current_trail_id, nil)
    update_attribute(:current_pin_id, nil)
  end

  private 

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
