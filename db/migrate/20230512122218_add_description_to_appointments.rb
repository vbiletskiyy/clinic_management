class AddDescriptionToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :description, :text
  end
end
