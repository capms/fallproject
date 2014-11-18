class AddAttachmentFiles9ToTeams < ActiveRecord::Migration
 def self.up
      add_attachment :teams, :files9
    end

  def self.down
    remove_attachment :teams, :files9
  end
end