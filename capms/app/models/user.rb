class User < ActiveRecord::Base
	belongs_to :team
	belongs_to :user_type
	has_many :documents
	has_many :approvals
end
