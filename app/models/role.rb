# frozen_string_literal: true

class Role < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  has_many :user_roles # rubocop:todo Rails/HasManyOrHasOneDependent
  has_many :users, through: :user_roles
end
