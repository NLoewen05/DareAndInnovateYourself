class InitialModels < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.references :categorizable, polymorphic: true, index: true

      t.timestamps
    end

    create_table :shops do |t|
      t.belongs_to :user, index: {unique: true}
      t.string :name
      t.text :description
      t.string :avatar

      t.timestamps
    end

    create_table :products do |t|
      t.belongs_to :shop, foreign_key: true 
      t.string :name
      t.string :caption
      t.text :description
      t.boolean :is_active

      t.timestamps
    end

    create_table :skus do |t|
      t.belongs_to :product, foreign_key: true
      t.string :sku
      t.float :price
      t.integer :quantity
      t.string :picture
      t.float :gst_rate
      t.float :pst_rate
      t.float :hst_rate
      t.boolean :is_active

      t.timestamps
    end

    create_table :orders do |t|
      t.belongs_to :user, foreign_key: true
      t.string :charge_id
      t.datetime :order_date
      t.float :gst_rate
      t.float :pst_rate
      t.float :hst_rate
      t.string :status
      
      t.timestamps
    end

    create_table :line_items do |t|
      t.belongs_to :sku, foreign_key: true
      t.belongs_to :order, foreign_key: true
      t.float :price
      t.integer :quantity

      t.timestamps
    end

    create_table :options do |t|
      t.references :optionable, polymorphic: true, index: true
      t.string :name
    end

    create_table :option_values do |t|
      t.belongs_to :option, foreign_key: true
      t.belongs_to :sku, foreign_key: true
      t.string :value
    end

    create_table :provinces do |t|
      t.string :name

      t.timestamps
    end

    create_table :addresses do |t|
      t.string :address_type
      t.string :address_line
      t.string :city
      t.string :postal_code
      t.belongs_to :province, foreign_key:true
      t.references :addressable, polymorphic: true, index: true

      t.timestamps
    end

  end
end
