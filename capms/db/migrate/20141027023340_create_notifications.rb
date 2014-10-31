class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :team_id
      t.integer :invited_by_id
      t.string :message

      t.timestamps
    end
  end
end
