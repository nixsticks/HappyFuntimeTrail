class CreateTagTrails < ActiveRecord::Migration
  def change
    create_table :tag_trails do |t|
      t.belongs_to :trail
      t.belongs_to :tag
    end
  end
end
