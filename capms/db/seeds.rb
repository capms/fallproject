# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#must destroy all User, UserType and Team data before running to guarentee success
UserType.create(id: 1, name: 'student')
UserType.create(id: 2, name: 'admin')
UserType.create(id: 3, name: 'industry')

User.create(first_name: 'Captain', last_name: 'Crunch', email: 'someone1@somewhere.com', password: 'password', user_type_id: 1, team_id: 1)
User.create(first_name: 'Tucan', last_name: 'Sam', email: 'someone2@somewhere.com', password: 'password', user_type_id: 1, team_id: 1)
User.create(first_name: 'Peter', last_name: 'Pan', email: 'someone3@somewhere.com', password: 'password', user_type_id: 1, team_id: 1)
User.create(first_name: 'Hulk', last_name: 'Hogan', email: 'someone4@somewhere.com', password: 'password', user_type_id: 1, team_id: 1)
User.create(first_name: 'Randy', last_name: 'Savage', email: 'someone5@somewhere.com', password: 'password', user_type_id: 1, team_id: 1)
User.create(first_name: 'Happy', last_name: 'Gilmore', email: 'someone6@somewhere.com', password: 'password', user_type_id: 1, team_id: 1)
User.create(first_name: 'Franken', last_name: 'Stein', email: 'someone7@somewhere.com', password: 'password', user_type_id: 1, team_id: 2)
User.create(first_name: 'Jekel', last_name: 'Hyde', email: 'someone8@somewhere.com', password: 'password', user_type_id: 1, team_id: 2)
User.create(first_name: 'Alvin', last_name: 'Chipmunks', email: 'someone9@somewhere.com', password: 'password', user_type_id: 1, team_id: 2)
User.create(first_name: 'Garfield', last_name: 'Odie', email: 'someone10@somewhere.com', password: 'password', user_type_id: 1, team_id: 3)
User.create(first_name: 'Bugs', last_name: 'Bunny', email: 'someone11@somewhere.com', password: 'password', user_type_id: 1, team_id: 3)
User.create(first_name: 'Yosemite', last_name: 'Sam', email: 'someone12@somewhere.com', password: 'password', user_type_id: 1, team_id: 3)
User.create(first_name: 'Mario', last_name: 'Luigi', email: 'someone13@somewhere.com', password: 'password', user_type_id: 1, team_id: 3)

User.create(first_name: 'Administrator', last_name: 'Bossman', email: 'someone14@somewhere.com', password: 'password', user_type_id: 2)

User.create(first_name: 'Industry', last_name: 'Professional', email: 'someone15@somewhere.com', password: 'password', user_type_id: 3)

Team.create(id: 1, name: 'The First Team', description: "Months of on-the-ground campaigning and a whopping $4 billion in spending culminate tonight in a midterm election that will determine control of the U.S. Senate and the fate of President Obama's legislative agenda for his final two years in the White House. Republicans need to pick up just six seats to gain control, and while political oddsmakers say such a gain is likely, analysts have been confounded by an aggressive get-out-the-vote operation and persistent questions about whether traditional polling methods capture a younger, more diverse electorate that doesn't own landline t",
			completion_status_id: 0, max_size: 7)
Team.create(id: 2, name: 'The Second Team', description: "Months of on-the-ground campaigning and a whopping $4 billion in spending culminate tonight in a midterm election that will determine control of the U.S. Senate and the fate of President Obama's legislative agenda for his final two years in the White House. Republicans need to pick up just six seats to gain control, and while political oddsmakers say such a gain is likely, analysts have been confounded by an aggressive get-out-the-vote operation and persistent questions about whether traditional polling methods capture a younger, more diverse electorate that doesn't own landline t",
			completion_status_id: 0, max_size: 5)
Team.create(id: 3, name: 'The Third Team', description: "Months of on-the-ground campaigning and a whopping $4 billion in spending culminate tonight in a midterm election that will determine control of the U.S. Senate and the fate of President Obama's legislative agenda for his final two years in the White House. Republicans need to pick up just six seats to gain control, and while political oddsmakers say such a gain is likely, analysts have been confounded by an aggressive get-out-the-vote operation and persistent questions about whether traditional polling methods capture a younger, more diverse electorate that doesn't own landline t",
			completion_status_id: 0, max_size: 7)

