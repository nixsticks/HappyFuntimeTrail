class AddImageRemoteUrltoTrails < ActiveRecord::Migration
  def change
    add_column :trails, :image_remote_url, :string
  end
end
