class AddFile5DescriptionToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :file5_description, :string
  end
end
