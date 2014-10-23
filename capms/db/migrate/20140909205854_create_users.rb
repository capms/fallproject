class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :pawprint
			t.string :first_name
			t.string :last_name
			t.string :picture_url
			#t.string :email
			t.string :semester
			t.string :phone
			t.string :resume_url
			t.text :about_me
			t.string :linkedin_url
			t.integer :user_type
			t.integer :team_id

			t.timestamps
		end
	end
end
