class CreateAcceptableUsers < ActiveRecord::Migration
  def change
    create_table :acceptable_users do |t|
    	t.string :user_id
  		t.integer :added_by
  		t.timestamps
    end
  end
end
