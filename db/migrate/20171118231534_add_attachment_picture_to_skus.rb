class AddAttachmentPictureToSkus < ActiveRecord::Migration[5.1]
  def self.up
    change_table :skus do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :skus, :picture
  end
end
