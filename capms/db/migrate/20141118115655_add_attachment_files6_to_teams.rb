class AddAttachmentFiles6ToTeams < ActiveRecord::Migration
   def self.up
      add_attachment :teams, :files6
    end

  def self.down
    remove_attachment :teams, :files6
  end
end
