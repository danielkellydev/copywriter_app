require 'rails_helper'

RSpec.describe Copy, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    subject { build(:copy) } # assuming you have a factory for Copy

    it { should validate_presence_of(:business_name) }

    it 'is not valid without a user' do
      subject.user = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a business_name' do
      subject.business_name = nil
      expect(subject).not_to be_valid
    end
  end

  # Additional tests for custom methods or other functionalities can go here
end