# app/admin/patients.rb

ActiveAdmin.register Patient do
  permit_params :name, :phone_number

  index do
    selectable_column
    id_column
    column :name
    column :phone_number
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :phone_number
      row :created_at
      row :updated_at
    end

    panel "Appointments" do
      table_for patient.appointments.includes(:doctor) do
        column :id
        column :date
        column :doctor
        column :created_at
      end
    end
  end
end
