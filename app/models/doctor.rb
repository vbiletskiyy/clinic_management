class Doctor < User
  has_many :appointments
  has_many :patients, through: :appointments
  has_and_belongs_to_many :specialties, join_table: "doctors_specialties"
end
