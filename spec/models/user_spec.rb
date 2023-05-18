require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        phone_number: Faker::PhoneNumber.cell_phone,
        password: '123123'
      )
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new(
        name: nil,
        email: Faker::Internet.email,
        phone_number: Faker::PhoneNumber.cell_phone,
        password: '123123'
      )
      expect(user).to_not be_valid
    end

    it 'is not valid without a email' do
      user = User.new(
        name: Faker::Name.name,
        email: nil,
        phone_number: Faker::PhoneNumber.cell_phone,
        password: '123123'
      )
      expect(user).to_not be_valid
    end

    it 'is not valid without a phone_number' do
      user = User.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        phone_number: nil,
        password: '123123'
      )
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user = User.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        phone_number: Faker::PhoneNumber.cell_phone,
        password: nil
      )
      expect(user).to_not be_valid
    end

    it 'is not valid with a duplicate email' do
      user = User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        phone_number: Faker::PhoneNumber.cell_phone,
        password: '123123'
      )
      user2 = User.new(
        name: Faker::Name.name,
        email: user.email,
        phone_number: Faker::PhoneNumber.cell_phone,
        password: '123123'
      )
      expect(user2).to_not be_valid
    end

    it 'normalizes phone number' do
      phone_number = '1234567890'
      user = User.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        phone_number: phone_number,
        password: '123123'
      )
      user.save
    
      expect(user.phone_number).to eq(PhoneNormalizerService.normalize(phone_number))
    end
  end
end