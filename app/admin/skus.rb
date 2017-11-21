ActiveAdmin.register Sku do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  menu parent: "Products", priority: 1

  permit_params :product_id, :sku, :price, :quantity, :gst_rate, :pst_rate, :hst_rate, :picture

  form do |f|
    f.inputs do 
      f.input :product
      f.input :sku
      f.input :price
      f.input :quantity
      f.input :gst_rate
      f.input :pst_rate
      f.input :hst_rate
      f.input :picture, as: :file, hint: image_tag(f.object.picture.url(:medium))
    end
    f.actions
  end

  show do |ad|
    attributes_table do
      row :product_id
      row :sku
      row :price
      row :quantity
      row :gst_rate
      row :pst_rate
      row :hst_rate
      row :picture do
        image_tag(ad.picture.url(:medium))
      end
      # Will display the image on show object page
    end
  end
end
