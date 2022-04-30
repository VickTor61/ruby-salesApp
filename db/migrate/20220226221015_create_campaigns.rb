# frozen_string_literal: true

class CreateCampaigns < ActiveRecord::Migration[5.2] # rubocop:todo Style/Documentation
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :message
      t.datetime :sent_at

      t.timestamps
    end
  end
end
