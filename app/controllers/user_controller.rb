class UserController < ApplicationController
	before_filter :authenticate_user!, :only => [:index]

	def index
		respond_to do |format|
			format.html
			format.js 
		end
	end

	def second_step
		@reg = Carmen::Country.coded("RU").subregions.map { |s| [s.name, s.code] }
		@count = Carmen::Country.coded("RU").subregions.size 
		@user = User.new(params[:user])
		@user.pol = params[:pol]
		@user.email = Random.rand(1...10000)
		@user.save(validate: false)
		respond_to do |format|
			format.js
    end
	end

	def next_step
		@user = User.find(params[:id])
		@user.country = params[:country]
		@user.region = params[:region]
		@user.update_attributes(params[:user])
		@user.save(validate: false)
		redirect_to user_session_path
	end

	def online_update
		current_user.update_attributes(updated_at: Time.now)
	end

	def users
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

end
