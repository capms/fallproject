class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.text :description 
      t.integer :completion_status_id
      t.integer :max_size
      t.timestamps
    end
  end
end
