FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    phone_number { FFaker::PhoneNumberUA.international_mobile_phone_number }
    password { 'password123' }

    trait :doctor do
      type { 'Doctor' }
      details {
        {
          education: FFaker::Education.major,
          experience: FFaker::Education.degree,
          biography: FFaker::Lorem.paragraph
        }
      }
    end

    trait :patient do
      type { 'Patient' }
    end
  end
end
