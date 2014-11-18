class AddFile2DescriptionToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :file2_description, :string
  end
end
