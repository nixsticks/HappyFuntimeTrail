class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.integer :latitude
      t.integer :longitude
    end
  end
end
