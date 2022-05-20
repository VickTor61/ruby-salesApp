# frozen_string_literal: true

class CreateContactLists < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_lists do |t|
      t.string :name
      t.string :slug

      t.references :campaign, null: false, foreign_key: true
      t.timestamps
    end
  end
end
