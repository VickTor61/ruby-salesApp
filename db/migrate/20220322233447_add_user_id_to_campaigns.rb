# frozen_string_literal: true

class AddUserIdToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :user_id, :integer
  end
end
