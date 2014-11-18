class AddFile7DescriptionToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :file7_description, :string
  end
end
