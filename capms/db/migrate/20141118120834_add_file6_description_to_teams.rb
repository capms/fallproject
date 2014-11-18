class AddFile6DescriptionToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :file6_description, :string
  end
end
