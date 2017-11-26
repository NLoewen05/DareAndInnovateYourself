class AddTaxRatesToProvinces < ActiveRecord::Migration[5.1]
  def change
    add_column :provinces, :gst_rate, :float
    add_column :provinces, :pst_rate, :float
    add_column :provinces, :hst_rate, :float
  end
end
