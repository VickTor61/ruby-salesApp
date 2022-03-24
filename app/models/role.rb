class Role < ApplicationRecord
  has_many :user_role
  has_many :user, :through => :user_role
end
