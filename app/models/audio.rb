class Audio < ActiveRecord::Base
  has_attached_file :attachment
  validates_attachment_file_name :attachment, :matches => [/mp3\Z/, /ogg\Z/, /wav\Z/, /m4a\Z/], message: "Please upload an audio file"

  belongs_to :pin
end
