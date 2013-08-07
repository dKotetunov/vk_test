class UserController < ApplicationController
	before_filter :authenticate_user!, :only => [:index]

	def index
		respond_to do |format|
			format.html
			format.js 
		end
	end

	def second_step
		@reg = Carmen::Country.coded('US').subregions.map { |s| [s.name, s.code] }
		user = User.new
		user.name = params[:name]
		user.surname = params[:surname]
		user.pol = params[:pol]
		#user.save(validate: false)
		respond_to do |format|
			format.js
    end
	end

end
