ActiveAdmin.register User do

  permit_params :email, :username, :first_name, :last_name,
                :phone_number, :profile_picture, :date_of_birth

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

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :date_of_birth
      f.input :phone_number
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
