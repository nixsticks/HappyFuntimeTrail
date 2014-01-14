class Tag < ActiveRecord::Base
  has_many :trail_tags
  has_many :trails, through: :trail_tags
end
