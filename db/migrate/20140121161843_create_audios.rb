class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.integer :user_id
      t.integer :pin_id
      t.attachment :attachment

      t.timestamps
    end
  end
end
