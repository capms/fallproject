class AddFile5TitleToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :file5Title, :string
  end
end
