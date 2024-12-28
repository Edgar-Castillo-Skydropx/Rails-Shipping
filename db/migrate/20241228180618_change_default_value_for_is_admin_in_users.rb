class ChangeDefaultValueForIsAdminInUsers < ActiveRecord::Migration[7.2]
  def change
    change_column_default :users, :isAdmin, from: true, to: false
  end
end
