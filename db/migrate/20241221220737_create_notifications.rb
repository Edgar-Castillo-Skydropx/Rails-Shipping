class CreateNotifications < ActiveRecord::Migration[7.2]
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :content
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
