class AddIsAdminToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :isAdmin, :boolean, null: true, default: true
  end
end
