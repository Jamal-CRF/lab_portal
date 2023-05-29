FactoryBot.define do
  factory :exame do
    association :doctor, factory: :user
    association :patient, factory: :user
    description { Faker::Lorem.paragraph }
    title { Faker::Lorem.sentence }
  end
end
