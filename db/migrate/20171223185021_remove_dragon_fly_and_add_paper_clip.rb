class RemoveDragonFlyAndAddPaperClip < ActiveRecord::Migration[5.1]
  def change
    remove_column :photos, :image_name
    remove_column :photos, :image_uid
    add_attachment :photos, :image
  end
end
