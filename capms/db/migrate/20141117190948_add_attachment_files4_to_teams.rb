class AddAttachmentFiles4ToTeams < ActiveRecord::Migration
  def self.up
      add_attachment :teams, :files4
    end

  def self.down
    remove_attachment :teams, :files4
  end
end