class CreateBulletins < ActiveRecord::Migration
  def change
    create_table :bulletins do |t|
      t.integer :user_id
      t.integer :team_id
      t.integer :invited_by_id
      t.integer :message_id
      t.boolean :approval_pending, :default => false
      t.timestamps
    end
  end
end
