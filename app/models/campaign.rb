# frozen_string_literal: true

class Campaign < ApplicationRecord
  validates :name, presence: true
  validates :message, presence: true, length: { minimum: 10 }
  belongs_to :user
  has_many :contact_lists, dependent: :destroy
end
