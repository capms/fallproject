class AddAttachmentFiles1ToTeams < ActiveRecord::Migration
    def self.up
      add_attachment :teams, :files1
    end

  def self.down
     remove_attachment :teams, :files1
  end
end
