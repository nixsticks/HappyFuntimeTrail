class Image < ActiveRecord::Base
    has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "100x100>" }
    validates_attachment_file_name :attachment, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/], message: "Please upload an image file"
    
    belongs_to :pin
end
