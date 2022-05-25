# frozen_string_literal: true

class ContactList < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  belongs_to :campaign
  belongs_to :user

end
