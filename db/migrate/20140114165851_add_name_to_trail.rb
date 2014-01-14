class AddNameToTrail < ActiveRecord::Migration
  def change
    add_column :trails, :name, :string
  end
end
