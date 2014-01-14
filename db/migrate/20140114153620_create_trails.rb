class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.integer :length 
      t.integer :popularity
      t.text :description

      t.timestamps
    end
  end
end
