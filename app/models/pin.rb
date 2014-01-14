class Pin < ActiveRecord::Base
  has_many :contents
  belongs_to :trail
end
