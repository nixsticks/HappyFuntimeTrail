class AddCurrentTrailAndCurrentPinToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_trail_id, :integer
    add_column :users, :current_pin_id, :integer
  end
end
