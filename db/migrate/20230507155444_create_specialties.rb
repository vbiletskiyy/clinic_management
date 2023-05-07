class CreateSpecialties < ActiveRecord::Migration[7.0]
  def change
    create_table :specialties do |t|
      t.string :title, null: false

      t.timestamps
    end

    add_index :specialties, :title, unique: true
  end
end
