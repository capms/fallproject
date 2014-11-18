class AddFile3DescriptionToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :file3_description, :string
  end
end
