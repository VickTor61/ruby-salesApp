class Campaign < ApplicationRecord
  # include Visible
  belongs_to :user

  validates :name, presence: true
  validates :message, presence: true, length: { minimum: 10 }
end
