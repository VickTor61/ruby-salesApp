FactoryBot.define do
  factory :user_role do
    user { FactoryBot.create(:user, email:'admin@gmail.com', password: 'username', password_confirmation: 'username') }
    role { FactoryBot.create(:role, name: 'admin', slug: 'admin') }
  end
end
