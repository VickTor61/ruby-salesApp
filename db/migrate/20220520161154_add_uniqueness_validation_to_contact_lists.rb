# frozen_string_literal: true

class AddUniquenessValidationToContactLists < ActiveRecord::Migration[5.2]
  def change
    add_index :contact_lists, :name, unique: true
    add_index :contact_lists, :slug, unique: true
  end
end
