class FriendsController < ApplicationController
	def request_to_friends
		friend = Friends.new
		friend.user1_id = current_user.id
		friend.user2_id_integer = params[:id]
		friend.type_req = false
		friend.save
		info = Information.new
		info.user_id = params[:id]
		info.type_inf = 'friend'
		info.save
	end

	def confirmation
		fr = Friends.current_user_friend(params[:id])
		fr.type_req = true
		fr.save
		Information.destroy_all(user_id: current_user.id, type_inf: 'friend')
		redirect_to :root
	end

	def requests
		@requests = Friends.not_friend(current_user.id)
		if @requests.present?
			@requests.each do |r|
				@users = User.where(id: r.user1_id)
			end
		else
			redirect_to friends_path
		end	
	end

	def index
		@requests = Friends.friends(current_user)
		if @requests.present?
			@requests.each do |r|
				@users = User.where(id: r.user1_id)
			end
		else
			@users = []
		end
	end

	def delete
		
	end

end
