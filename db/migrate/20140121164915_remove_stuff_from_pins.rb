class RemoveStuffFromPins < ActiveRecord::Migration
  def change
    drop_attached_file :pins, :photo
    remove_column :pins, :text
  end
end
