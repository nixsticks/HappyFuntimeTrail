class Image < ActiveRecord::Base
    has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "100x100>" }
    belongs_to :pin
end
