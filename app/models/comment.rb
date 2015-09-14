class Comment < ActiveRecord::Base
	belongs_to :topic
	paginates_per 5

  	def get_replies
  		Comment.where(reply_to: self.id)
  	end

  	def has_reply?
  		Comment.exists?(reply_to: self.id)
  	end
  	
end
