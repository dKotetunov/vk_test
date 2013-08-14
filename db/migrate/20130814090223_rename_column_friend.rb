class RenameColumnFriend < ActiveRecord::Migration
  def change
  	rename_column :friends, :type, :type_req
  end
end
