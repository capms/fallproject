class AddFile4TitleToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :file4Title, :string
  end
end
