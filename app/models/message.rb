class Message < ActiveRecord::Base
	attr_accessible :mess_body, :recipient_id, :sender_id

	belongs_to :sender, :class_name => 'User'
	belongs_to :recipient, :class_name => 'User'

	def self.f_name(id)
		User.find(id).full_name
	end
end