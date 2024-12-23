class RenameTypeToTypeTo < ActiveRecord::Migration[7.2]
  def change
    rename_column :notifications, :type, :type_to
  end
end
