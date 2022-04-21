# frozen_string_literal: true

FactoryBot.define do
  factory :user_role do
    user do
      FactoryBot.create(:user, email: 'admin@gmail.com', password: 'username',
                               password_confirmation: 'username')
    end
    role { FactoryBot.create(:role, name: 'admin', slug: 'admin') }
  end
end
