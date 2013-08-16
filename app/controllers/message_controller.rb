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
		info = Information.new
		info.user_id = params[:recipient_id]
		info.type_inf = 'mess'
		info.save
	end

	def show
		@mes = Message.find(params[:id])
		inf = Information.where(user_id: params[:recipient_id], type_inf: 'mess').first
		if inf.present?
			inf.destroy
		end
	end

end
