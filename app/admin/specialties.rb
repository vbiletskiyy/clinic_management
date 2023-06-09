# app/admin/specialties.rb

ActiveAdmin.register Specialty do
  permit_params :title

  index do
    selectable_column
    id_column
    column :title
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
    end
    f.actions
  end
end
