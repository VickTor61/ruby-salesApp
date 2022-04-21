# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t| # rubocop:todo Rails/CreateTableWithTimestamps
      t.string :name
      t.string :slug
    end
    add_index :roles, :name, unique: true
    add_index :roles, :slug, unique: true
  end
end
