class Role < ApplicationRecord
  has_many :user
  has_many :user, :through => :user_role
end
