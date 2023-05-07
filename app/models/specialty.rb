class Specialty < ApplicationRecord
  has_and_belongs_to_many :doctors, join_table: "doctors_specialties"
end
