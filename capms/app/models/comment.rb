class Comment < ActiveRecord::Base
	#every comment belongs to a message
  belongs_to :message
end
