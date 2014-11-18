class AddFile8DescriptionToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :file8_description, :string
  end
end
