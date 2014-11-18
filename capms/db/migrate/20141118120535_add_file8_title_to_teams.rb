class AddFile8TitleToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :file8Title, :string
  end
end
