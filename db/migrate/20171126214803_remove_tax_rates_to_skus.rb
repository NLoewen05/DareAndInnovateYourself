class RemoveTaxRatesToSkus < ActiveRecord::Migration[5.1]
  def change
    remove_column :skus, :gst_rate, :float
    remove_column :skus, :pst_rate, :float
    remove_column :skus, :hst_rate, :float
  end
end
