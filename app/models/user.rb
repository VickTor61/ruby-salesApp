# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :contact_lists
  has_many :campaigns
  has_many :user_roles
  has_many :roles, through: :user_roles, dependent: :destroy
  accepts_nested_attributes_for :roles, allow_destroy: true

  def admin?
    roles.where(slug: 'admin').any?
  end

  def super_admin?
    roles.where(slug: 'superadmin').any?
  end
end
