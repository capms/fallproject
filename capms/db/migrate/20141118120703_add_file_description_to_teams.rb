class AddFileDescriptionToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :file_description, :string
  end
end
