require 'rails_helper'

RSpec.describe AppointmentsController, type: :request do
  let(:doctor) { create(:user, :doctor) }
  let(:patient) { create(:user, :patient) }
  let(:page) { Capybara::Node::Simple.new(response.body) } 

  before(:each) do
    sign_in patient
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) do
        {
          patient_id: patient.id,
          doctor_id: doctor.id,
          time: DateTime.current + 1.day,
          date: Date.current
        }
      end

      it 'creates a new appointment' do
        expect {
          post appointments_path, params: valid_params
        }.to change(Appointment, :count).by(1)
      end

      it 'redirects to appointments index response.body' do
        post appointments_path, params: valid_params
        expect(response).to redirect_to(appointments_path)
      end
    end

    context 'with invalid params' do
      let(:invalid_params) do
        {
          patient_id: nil,
          doctor_id: doctor.id,
          time: nil,
          date: nil
        }
      end

      it 'does not create a new appointment' do
        expect {
          post appointments_path, params: invalid_params
        }.not_to change(Appointment, :count)
      end

      it 'renders the new appointment page with errors' do
        post appointments_path, params: invalid_params
        expect(response.body).to include('Patient must exist')
        expect(response.body).to include("Time can&#39;t be blank")
        expect(response.body).to include("Date can&#39;t be blank")
      end
    end
  end
end
