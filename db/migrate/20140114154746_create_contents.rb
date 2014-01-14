class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :text
    end
  end
end
