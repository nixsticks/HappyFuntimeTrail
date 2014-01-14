class AddPinIdToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :pin_id, :integer
  end
end
