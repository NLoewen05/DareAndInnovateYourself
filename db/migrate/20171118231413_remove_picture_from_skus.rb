class RemovePictureFromSkus < ActiveRecord::Migration[5.1]
  def change
    remove_column :skus, :picture, :string
  end
end
