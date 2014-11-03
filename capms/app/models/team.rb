class Team < ActiveRecord::Base
	has_many :users
	belongs_to :completion_status
	has_many :notifications
end
