# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :campaigns # rubocop:todo Rails/HasManyOrHasOneDependent
  has_many :user_roles # rubocop:todo Rails/HasManyOrHasOneDependent
  has_many :roles, through: :user_roles

  def admin?
    roles.where(slug: 'admin').any?
  end
end
