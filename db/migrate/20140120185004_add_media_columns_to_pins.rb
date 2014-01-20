class AddMediaColumnsToPins < ActiveRecord::Migration
  def change
    add_column :pins, :text, :string
    add_column :pins, :video, :string
    add_column :pins, :audio, :string
    add_column :pins, :photo, :string
  end
end
