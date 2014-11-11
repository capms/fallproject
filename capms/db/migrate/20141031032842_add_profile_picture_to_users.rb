class AddProfilePictureToUsers < ActiveRecord::Migration
def self.up
    add_attachment :users, :profilepicture
  end

  def self.down
    remove_attachment :users, :profilepicture
  end
end