class Audio < ActiveRecord::Base
  has_attached_file :attachment
  validates_attachment_content_type :attachment, :content_type => /\Aaudio/, message: "Please upload an audio file"

  belongs_to :pin
end
