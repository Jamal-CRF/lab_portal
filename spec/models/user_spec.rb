require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = FactoryBot.build(:user, name: nil)
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user = FactoryBot.build(:user, email: nil)
      expect(user).to_not be_valid
    end

    it 'is not valid without a phone number' do
      user = FactoryBot.build(:user, phone_number: nil)
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user = FactoryBot.build(:user, password: nil)
      expect(user).to_not be_valid
    end

    it 'is not valid with a duplicate email' do
      email = Faker::Internet.email
      FactoryBot.create(:user, email: email)
      user = FactoryBot.build(:user, email: email)
      expect(user).to_not be_valid
    end

    it 'normalizes phone number' do
      phone_number = '1234567890'
      user = FactoryBot.build(:user, phone_number: phone_number)
      user.save
      expect(user.phone_number).to eq(PhoneNormalizerService.normalize(phone_number))
    end
  end
end
