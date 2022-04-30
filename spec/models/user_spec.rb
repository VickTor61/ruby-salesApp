# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Model.user' do
    let(:user1) { create :user }

    it 'does not create a user without an email address' do
      user1.email = nil
      expect(user1).not_to be_valid
    end

    it 'does not create a user without a password' do
      user1.password = nil
      expect(user1).not_to be_valid
    end

    it 'does not create a user without a valid password confirmation' do
      expect(user1).to be_valid_password('osasenaga')
    end
  end
end
