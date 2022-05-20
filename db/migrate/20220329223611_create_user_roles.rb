# frozen_string_literal: true

class CreateUserRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_roles do |t| # rubocop:todo Rails/CreateTableWithTimestamps
      t.references :user, foreign_key: true
      t.references :role, foreign_key: true
    end
  end
end
