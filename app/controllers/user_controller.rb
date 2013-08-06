class UserController < ApplicationController
	before_filter :authenticate_user!, :only => [:index]

	def index
		respond_to do |format|
			format.html
			format.js 
		end
	end

	def second_step
		@@user = User.new
		@@user.name = params[:name]
		@@user.surname = params[:surname]
		@@user.pol = params[:pol]
		
		respond_to do |format|
			format.js
    end
	end

end
