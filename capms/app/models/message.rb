class Message < ActiveRecord::Base
	#messages have many comments and are destroying depends on confirmation
	has_many :comments, dependent: :destroy
	#the title must be at least 5 characters
	validates :title, presence: true,
                    length: { minimum: 5 }
end
