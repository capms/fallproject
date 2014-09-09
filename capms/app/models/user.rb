class User < ActiveRecord::Base
	belongs_to :team
	belongs_to :user_type
end
