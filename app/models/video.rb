class Video < ActiveRecord::Base
  has_attached_file :attachment
  validates_attachment_content_type :attachment, :content_type => /\video/, message: "Please upload a video file"

  belongs_to :pin
end
