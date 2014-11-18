class AddFile4DescriptionToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :file4_description, :string
  end
end
