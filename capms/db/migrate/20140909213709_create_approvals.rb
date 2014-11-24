class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.integer :user_id
      t.string :file_url
      t.timestamps
    end
  end
end
