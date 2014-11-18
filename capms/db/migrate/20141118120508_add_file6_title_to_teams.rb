class AddFile6TitleToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :file6Title, :string
  end
end
