class Image < ActiveRecord::Base
    has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "100x100>" }
    validates_attachment_content_type :attachment, :content_type => /\Aimage/, message: "Please upload an image file"
    
    belongs_to :pin
end
