class AcceptableStudentIds < ActiveRecord::Migration
  def change
  	create_table :acceptable_students do |t|
  		t.string :studentId
  		t.integer :addedBy
  		t.timestamps
  	end
  end
end
