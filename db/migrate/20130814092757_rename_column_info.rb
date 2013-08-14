class RenameColumnInfo < ActiveRecord::Migration
  def change
  	rename_column :information, :type, :type_inf
  end
end
