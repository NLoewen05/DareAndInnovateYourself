ActiveAdmin.register User do
  index do
    selectable_column
    excluded_columns = ["encrypted_password", "reset_password_token", "reset_password_sent_at"]
    (User.column_names - excluded_columns).each do |column|
      column column.to_sym
    end
    actions
  end

  filter :username
  filter :email
  filter :first_name
  filter :last_name
  filter :created_at
  filter :date_of_birth
  filter :phone_number

  
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :email, :username, :first_name, :last_name, :phone_number, :profile_picture, :date_of_birth
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
end
