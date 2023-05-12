ActiveAdmin.register AdminUser do
  permit_params :phone_number, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :phone_number
    column :created_at
    actions
  end

  filter :phone_number
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :phone_number
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
