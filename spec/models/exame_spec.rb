require 'rails_helper'

RSpec.describe Exame, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      exame = FactoryBot.build(:exame)
      expect(exame).to be_valid
    end

    it 'is not valid without a title' do
      exame = FactoryBot.build(:exame, title: nil)
      expect(exame).to_not be_valid
    end

    it 'is not valid without a description' do
      exame = FactoryBot.build(:exame, description: nil)
      expect(exame).to_not be_valid
    end

    it 'is not valid without a doctor' do
      exame = FactoryBot.build(:exame, doctor: nil)
      expect(exame).to_not be_valid
    end

    it 'is not valid without a patient' do
      exame = FactoryBot.build(:exame, patient: nil)
      expect(exame).to_not be_valid
    end
  end
end
