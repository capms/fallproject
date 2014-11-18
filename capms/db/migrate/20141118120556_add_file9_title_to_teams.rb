class AddFile9TitleToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :file9Title, :string
  end
end
