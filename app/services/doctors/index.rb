module Doctors
  class Index
    def call(params)
      @params = params
      doctors = find_doctors
      {doctors: doctors, specialties: Specialty.all}
    end

    private
    
    def find_doctors
      doctors = Doctor.includes(:specialties).with_attached_avatar

      return doctors unless @params

      doctors.where(specialties: {title: @params})
    end
  end
end
