FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.cell_phone }
    password { '123123' }

    trait :doctor do
      after(:create) do |user|
      FactoryBot.create(:doctor_user_hospital, user: user)
      end
    end

    trait :patient do
      after(:create) do |user|
        FactoryBot.create(:patient_user_hospital, user: user)
      end
    end
  end
end
