class AddUserIdAndPinIdToContent < ActiveRecord::Migration
  def change
    add_column :contents, :user_id, :integer
    add_column :contents, :pin_id, :integer
  end
end
