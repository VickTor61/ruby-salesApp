class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :campaigns
  has_many :user_roles
  has_many :roles, through: :user_roles

  def admin?
    roles.where(slug: 'admin').any?
  end
end
