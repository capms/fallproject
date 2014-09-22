class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.integer :filetype 
      t.string :file_extension
      t.integer :user_id
      t.timestamps
    end
  end
end
