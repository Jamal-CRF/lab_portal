FactoryBot.define do
  factory :doctor_user_hospital, class: UserHospital do
    association :user, factory: :user
    association :hospital, factory: :hospital
    role { 'doctor' }
  end

  factory :patient_user_hospital, class: UserHospital do
    association :user, factory: :user
    association :hospital, factory: :hospital
    role { 'patient' }
  end
end
