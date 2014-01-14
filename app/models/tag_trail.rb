class TagTrail < ActiveRecord::Base
  belongs_to :trail
  belongs_to :tag
end
