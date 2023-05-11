class Specialty < ApplicationRecord
  validates :title, presence: true, uniqueness: true 
  has_and_belongs_to_many :doctors, join_table: "doctors_specialties"
end
