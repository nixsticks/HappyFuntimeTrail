class AddStepnumberToPins < ActiveRecord::Migration
  def change
    add_column :pins, :stepnumber, :integer
  end
end
