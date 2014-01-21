class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :content
      t.integer :user_id
      t.integer :pin_id

      t.timestamps
    end
  end
end
