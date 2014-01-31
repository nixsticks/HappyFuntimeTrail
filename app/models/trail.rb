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
      user.stop_trail
    else
      user.update_attribute(:current_pin_id, pins.find_by_stepnumber(pin.stepnumber + 1).id)
    end
  end

  def increment_stepnumbers
    self.pins.each do |pin|
      all_pins = self.pins.sort_by {|pin| pin.id}
      index = all_pins.index(pin)
      pin.update_attribute(:stepnumber, (index + 1))
    end
  end

  def set_length
    length = self.pins.size
    self.update_attribute(:length, length)
  end

  def get_length
    return self.length
  end

  def editable?(user)
    (user == self.creator) || user.god?
  end

  def static_img_url(img_width, img_height, maptype="hybrid", path_color="red", path_weight="4")
    url = "http://maps.googleapis.com/maps/api/staticmap?"\
          "&size=#{img_width}x#{img_height}"\
          "&maptype=#{maptype}"
    pins = self.pins
    pin_coords = []

    pins.each_with_index do |pin, i| 
      pin_latlng = "#{pin.latitude.to_f},#{pin.longitude.to_f}"
      pin_coords << pin_latlng
      pin_url = "&markers=color:red|label:#{i}|#{pin_latlng}"
      url << pin_url
    end

    #now making part of the url that creates the trail path
    path_url = "&path=color:#{path_color}|weight:#{path_weight}"

    pin_coords.each do |pcoord|
      path_url << "|" + pcoord
    end

    url << path_url
    url << "&sensor=false"
    url
  end
  
end