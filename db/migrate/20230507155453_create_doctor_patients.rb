class CreateDoctorPatients < ActiveRecord::Migration[7.0]
  def change
    create_table :doctor_patients, id: false do |t|
      t.belongs_to :doctor, foreign_key: { to_table: :users }
      t.belongs_to :patient, foreign_key: { to_table: :users }
    end
  end
end
