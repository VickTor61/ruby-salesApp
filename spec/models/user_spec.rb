require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Model.user' do
     let(:user1) { FactoryBot.create :user}
   
     it 'should have a user created after creation' do
       expect(User.all.count).to eq(1)
     end
   
     it 'should not create a user without an email address' do
      user1.email = nil
      expect(user1).to_not be_valid
     end

     it 'should not create a user without a password' do
       user1.password = nil
       expect(user1).to_not be_valid
     end

     it 'should not create a user without a valid password confirmation' do
       expect(user1.valid_password?('osasenaga')).to be_truthy
     end
   end
 end
