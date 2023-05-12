FactoryBot.define do
  factory :appointment do
    association :doctor, factory: :user, traits: [:doctor] 
    association :patient, factory: :user, traits: [:patient]
    date { Date.today + 1 }
    time { "12:00 PM" }
    description { "Check-up" }
  end
end
