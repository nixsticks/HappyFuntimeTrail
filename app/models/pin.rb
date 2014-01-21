class Pin < ActiveRecord::Base
  has_many :contents
  belongs_to :trail
  has_many :current_users,
    class_name: 'User',
    foreign_key: 'current_pin_id'
  has_many :texts, dependent: :destroy
  has_many :audios, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :videos, dependent: :destroy


  accepts_nested_attributes_for :texts, :audios, :images, :videos, allow_destroy: true
end
