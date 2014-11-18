class AddFile7TitleToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :file7Title, :string
  end
end
