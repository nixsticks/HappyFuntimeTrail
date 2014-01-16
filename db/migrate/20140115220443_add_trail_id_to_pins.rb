class AddTrailIdToPins < ActiveRecord::Migration
  def change
    add_column :pins, :trail_id, :integer
  end
end
