class AddAttachmentFiles5ToTeams < ActiveRecord::Migration
   def self.up
      add_attachment :teams, :files5
    end

  def self.down
    remove_attachment :teams, :files5
  end
end
