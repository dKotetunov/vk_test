class Friends < ActiveRecord::Base
  attr_accessible :type_req, :user1_id, :user2_id_integer

  def self.current_user_friend(id)
    Friends.where(user1_id: id, user2_id_integer: current_user.id).first
  end

  def self.not_friend(id)
  	Friends.where(user2_id_integer: id, type_req: false)
  end

  def self.friends(current_user)
  	where((:user1_id == current_user.id && :type_req == true) | (:user2_id_integer == current_user && :type_req == true))
  end
end
