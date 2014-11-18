class AddFile3TitleToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :file3Title, :string
  end
end
