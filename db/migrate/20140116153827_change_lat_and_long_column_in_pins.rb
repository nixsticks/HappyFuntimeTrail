class ChangeLatAndLongColumnInPins < ActiveRecord::Migration
  def change
    remove_column :pins, :latitude
    remove_column :pins, :longitude
    add_column :pins, :latitude, :decimal
    add_column :pins, :longitude, :decimal
  end
end
