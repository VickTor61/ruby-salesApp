require 'rails_helper'

RSpec.describe User, type: :model do
  context "Before authentication" do
    it 'has correct passwords' do
      user = User.create(
        email: "test@example.com",
        password: "password123",
        password_confirmation: "password123"
      )
      expect(user.valid_password?("password123")).to be_truthy

      # pending "add some examples to (or delete) #{__FILE__}"
       end
  end

  end