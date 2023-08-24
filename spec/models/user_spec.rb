require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test
  describe 'associations' do
    it { should have_many(:copies) }
  end
  
  describe 'validations' do
    
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
  end
  

end