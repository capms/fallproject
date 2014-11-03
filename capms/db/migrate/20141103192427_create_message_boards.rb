class CreateMessageBoards < ActiveRecord::Migration
  def change
    create_table :message_boards do |t|
      t.string :title
      t.string :text
      t.string :text

      t.timestamps
    end
  end
end
