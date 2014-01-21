class Trail < ActiveRecord::Base
  has_many :tag_trails
  has_many :tags, through: :tag_trails
  belongs_to :creator,
    class_name: 'User'
  has_many :trail_followers
  has_many :followers,
    class_name: 'User',
    through: :trail_followers
  has_many :current_users,
    class_name: 'User',
    foreign_key: 'current_trail_id'
  has_many :pins, order: 'stepnumber ASC', dependent: :destroy
  accepts_nested_attributes_for :pins, :reject_if => proc { |pin| pin[:address].blank? }, allow_destroy: true

  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 10}

  def next_pin(pin) #pass in user's current pin
    if pins.last.stepnumber == pin.stepnumber
      redirect_to #win_path
    else
      current_user.update_attribute(:current_pin_id, pins.find_by_stepnumber(pin.stepnumber + 1).id)
    end
  end
end
