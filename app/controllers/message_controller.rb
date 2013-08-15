class MessageController < ApplicationController

	def index
		@mes = (current_user.sent_messages << current_user.received_messages).order('created_at ASC')
	end

	def new
		respond_to do |format|
      format.html
    end
	end

	def sen_mess
		mes = Message.new
		mes.sender_id = params[:sender_id]
		mes.recipient_id = params[:recipient_id]
		mes.mess_body = params[:message][:mess_body]
		mes.save
		#info = Information.new

	end

end
