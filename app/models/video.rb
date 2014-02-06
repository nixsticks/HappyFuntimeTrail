class Video < ActiveRecord::Base
  has_attached_file :attachment
  validates_attachment_file_name :attachment, :matches => [/mp4\Z/, /avi\Z/, /mpe?g\Z/, /mov\Z/, /m4v\Z/], message: "Please upload a video file"

  belongs_to :pin
end
