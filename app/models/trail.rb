class Trail < ActiveRecord::Base
  has_many :tag_trails
  has_many :tags, through: :tag_trails
  belongs_to :creator,
    class_name: 'User'
  has_many :trail_followers
  has_many :followers,
    class_name: 'User',
    through: :trail_followers
end
