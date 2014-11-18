class AddFile9DescriptionToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :file9_description, :string
  end
end
