class MessageController < ApplicationController

	def index
		@mes = (current_user.sent_messages << current_user.received_messages).order('created_at ASC')
	end

	def new

	end

	def sen_mess
		UserMailer.sending(params[:mail]).deliver
	end

	def show
		@mes = Message.find(params[:id])
		inf = Information.add_new_mess(params[:recipient_id])
		if inf.present?
			inf.destroy
		end
	end

end
