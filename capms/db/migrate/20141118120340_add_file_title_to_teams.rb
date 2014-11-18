class AddFileTitleToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :fileTitle, :string
  end
end
