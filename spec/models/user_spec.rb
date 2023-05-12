require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when phone_number is not valid' do
    let(:user) { build(:user, :doctor, phone_number: '12345') }

    it 'is not valid' do
      expect(user).to_not be_valid
    end

    it 'has a proper error message' do
      user.valid?
      expect(user.errors[:phone_number]).to include("is invalid")
    end
  end

  context 'when phone_number is valid' do
    let(:user) { build(:user, phone_number: '+380678892541') }

    it 'is valid' do
      expect(user).to be_valid
    end
  end
end
