class AddAttachmentToTrails < ActiveRecord::Migration
  def change
    remove_column :trails, :image_remote_url
    add_attachment :trails, :image
  end
end
