class UserController < ApplicationController
	#before_filter :authenticate_user!

	def index
		
	end

	  def after_sign_in_path_for(resource)
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
    if request.referer == sign_in_url
      root_path
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end
end
