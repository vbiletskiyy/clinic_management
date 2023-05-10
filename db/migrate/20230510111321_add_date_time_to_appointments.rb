class AddDateTimeToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :date, :datetime, null: false
    add_column :appointments, :time, :datetime, null: false
  end
end
