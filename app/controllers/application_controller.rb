require 'carmen'
include Carmen

class ApplicationController < ActionController::Base
  protect_from_forgery

  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def friends_count
    count = Information.where(user_id: current_user.id, type_inf: 'friend').count
    count if count > 0
  end


  def mess_count
    count = Information.where(user_id: current_user.id, type_inf: 'mess').count
    count if count > 0
  end

  helper_method :friends_count, :mess_count

  private

  def after_sign_in_path_for(resource_or_scope)
    #update user status to online
    root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    #update user status to offline
    root_path
  end
end
