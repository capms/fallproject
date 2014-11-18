class AddFile1DescriptionToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :file1_description, :string
  end
end
