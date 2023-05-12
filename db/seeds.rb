require 'factory_bot_rails'

specialties = ['Cardiology', 'Dermatology', 'Endocrinology', 'Neurology', 'Ophthalmology', 'Pediatrics', 'Therapist'].map do |title|
  Specialty.create(title: title)
end

# Create doctors
doctors = FactoryBot.create_list(:user, 7, :doctor)

# Assign random specialties to doctors
Doctor.all.each do |doctor|
  specialty = specialties.sample
  doctor.specialties << specialty
  specialties.delete(specialty)
end

# Create patient
patient = FactoryBot.create(:user, :patient)

AdminUser.create!(phone_number: '380677756821', password: 'password')
