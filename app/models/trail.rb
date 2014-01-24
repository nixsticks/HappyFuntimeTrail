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

  def next_pin(pin, user) #pass in user's current pin
    if pins.last.stepnumber == pin.stepnumber
      self.followers << user unless self.followers.include?(user)
      user.update_attribute(:current_trail_id, nil)
      user.update_attribute(:current_pin_id, nil)
    else
      user.update_attribute(:current_pin_id, pins.find_by_stepnumber(pin.stepnumber + 1).id)
    end
  end

  def editable?(user)
    user == self.creator || user.god?
  end

  def increment_stepnumbers
    self.pins.each do |pin|
      all_pins = self.pins.sort_by {|pin| pin.id}
      index = all_pins.index(pin)
      pin.update_attribute(:stepnumber, (index + 1))
    end
  end
end