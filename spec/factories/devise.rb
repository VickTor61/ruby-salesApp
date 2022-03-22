FactoryBot.define do
  factory :user do
    email { 'food1@gmail.com' }
    password { 'osasenaga' }
    password_confirmation { 'osasenaga' }
  end
end