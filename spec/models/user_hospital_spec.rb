require 'rails_helper'

RSpec.describe UserHospital, type: :model do
  describe 'validations' do
    context 'as a doctor' do
      it 'is valid with valid attributes' do
        user_hospital = FactoryBot.build(:doctor_user_hospital)
        expect(user_hospital).to be_valid
      end

      it 'is not valid without a user' do
        user_hospital = FactoryBot.build(:doctor_user_hospital, user: nil)
        expect(user_hospital).not_to be_valid
      end

      it 'is not valid without a hospital' do
        user_hospital = FactoryBot.build(:doctor_user_hospital, hospital: nil)
        expect(user_hospital).not_to be_valid
      end

      it 'is not valid without a role' do
        user_hospital = FactoryBot.build(:doctor_user_hospital, role: nil)
        expect(user_hospital).not_to be_valid
      end

      it 'is valid with the role set as "doctor"' do
        user_hospital = FactoryBot.build(:doctor_user_hospital, role: 'doctor')
        expect(user_hospital).to be_valid
      end
    end

    context 'as a patient' do
      it 'is valid with valid attributes' do
        user_hospital = FactoryBot.build(:patient_user_hospital)
        expect(user_hospital).to be_valid
      end

      it 'is not valid without a user' do
        user_hospital = FactoryBot.build(:patient_user_hospital, user: nil)
        expect(user_hospital).not_to be_valid
      end

      it 'is not valid without a hospital' do
        user_hospital = FactoryBot.build(:patient_user_hospital, hospital: nil)
        expect(user_hospital).not_to be_valid
      end

      it 'is not valid without a role' do
        user_hospital = FactoryBot.build(:patient_user_hospital, role: nil)
        expect(user_hospital).not_to be_valid
      end

      it 'is valid with the role set as "patient"' do
        user_hospital = FactoryBot.build(:patient_user_hospital, role: 'patient')
        expect(user_hospital).to be_valid
      end
    end
  end
end
