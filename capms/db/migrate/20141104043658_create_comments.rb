class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.integer :commenter_id
      t.text :body
      t.references :message, index: true

      t.timestamps
    end
  end
end
