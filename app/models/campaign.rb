class Campaign < ApplicationRecord
  validates :name, presence: true
  validates :message, presence: true, length: { minimum: 10 }
end
