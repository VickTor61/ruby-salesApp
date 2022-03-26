class Role < ApplicationRecord
  validates :name, presence: true
  validates :slug, presence: true
end
