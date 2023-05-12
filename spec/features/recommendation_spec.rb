require 'rails_helper'

RSpec.feature "Leaving a recommendation", type: :feature do
  let(:doctor) { create(:user, :doctor) }
  let(:patient) { create(:user, :patient) }
  let!(:appointment) { create(:appointment, doctor_id: doctor.id, patient_id: patient.id) }

  before(:each) do
    visit user_session_path

    fill_in 'Phone number', with: doctor.phone_number
    fill_in 'Password', with: doctor.password
    
    click_button "Sign in"
  end
  
  scenario "Doctor leaves a recommendation" do
    visit appointments_path
    
    find('button[data-bs-target="#exampleModal"]').click
    fill_in "recommendation", with: "This is an important recommendation that all patients should follow."

    click_button 'recommendation_button'

    expect(page).to have_content('Appointment has been successfully updated')
    expect(page).to have_content('You have no appointments scheduled')
  end
end
