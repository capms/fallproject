class CreatePublishRequests < ActiveRecord::Migration
  def change
    create_table :publish_requests do |t|
      t.boolean :public
      t.integer :file_id
      t.timestamps
    end
  end
end
