class AddFile1TitleToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :file1Title, :string
  end
end
