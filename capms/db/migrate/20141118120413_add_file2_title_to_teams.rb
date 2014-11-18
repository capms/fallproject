class AddFile2TitleToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :file2Title, :string
  end
end
