class RemoveTextAudioVideoandPhotoFromPins < ActiveRecord::Migration
  def change
    remove_column :pins, :video, :string
    remove_column :pins, :audio, :string
    remove_column :pins, :photo, :string
  end
end
