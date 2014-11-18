class AddAttachmentFiles2ToTeams < ActiveRecord::Migration
  def self.up
      add_attachment :teams, :files2
    end

  def self.down
    remove_attachment :teams, :files2
  end
end