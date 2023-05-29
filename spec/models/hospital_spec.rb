require 'rails_helper'

RSpec.describe Hospital, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      hospital = FactoryBot.build(:hospital)
      expect(hospital).to be_valid
    end

    it 'is not valid without a name' do
      hospital = FactoryBot.build(:hospital, name: nil)
      expect(hospital).to_not be_valid
    end
  end
end
