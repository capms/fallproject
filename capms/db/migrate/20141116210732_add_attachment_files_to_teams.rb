class AddAttachmentFilesToTeams < ActiveRecord::Migration
  def self.up
      add_attachment :teams, :files
    end

  def self.down
    remove_attachment :teams, :files
  end
end
