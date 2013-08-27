class Information < ActiveRecord::Base
  attr_accessible :type_inf, :user_id

  def self.add_new_mess(id)
  	Information.where(user_id: id, type_inf: 'mess').first
  end
end
