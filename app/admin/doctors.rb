ActiveAdmin.register Doctor do
  permit_params :phone_number, :password, :avatar,  { details: [:education, :biography, :experience] }

  index do
    selectable_column
    id_column
    column :name
    column :phone_number
    column :avatar do |doctor|
      image_tag doctor.avatar, size: "100x100" if doctor.avatar.attached?
    end
    column :education do |doctor|
      doctor.details["education"]
    end
    column :biography do |doctor|
      doctor.details["biography"]
    end
    column :experience do |doctor|
      doctor.details["experience"]
    end  
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs "Doctor Details" do
      f.input :phone_number
      f.input :avatar, as: :file
      f.inputs details: "Details", for: :details do |d|
        d.input :education, input_html: { value: "#{doctor.details['education']}" }
        d.input :biography, input_html: { value: "#{doctor.details['biography']}" }
        d.input :experience, input_html: { value: "#{doctor.details['experience']}" }
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :phone_number
      row :avatar
      row :created_at
      row :updated_at
      row :details do |doctor|
        simple_format(JSON.pretty_generate(doctor.details))
      end
    end
  end
end
