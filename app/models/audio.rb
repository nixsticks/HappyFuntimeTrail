class Audio < ActiveRecord::Base
  has_attached_file :attachment
  belongs_to :pin
end
