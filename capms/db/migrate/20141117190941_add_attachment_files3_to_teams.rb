class AddAttachmentFiles3ToTeams < ActiveRecord::Migration
  def self.up
      add_attachment :teams, :files3
    end

  def self.down
    remove_attachment :teams, :files3
  end
end