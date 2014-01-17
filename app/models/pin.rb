class Pin < ActiveRecord::Base
  has_many :contents
  belongs_to :trail
  has_many :current_users,
    class_name: 'User',
    foreign_key: :current_pin_id
end
