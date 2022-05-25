class AddUserIdToContactList < ActiveRecord::Migration[5.2]
  def change
    add_column :contact_lists, :user_id, :boolean
  end
end
