class AddAttachmentFiles8ToTeams < ActiveRecord::Migration
 def self.up
      add_attachment :teams, :files8
    end

  def self.down
    remove_attachment :teams, :files8
  end
end
