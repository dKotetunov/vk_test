class ChangeNameTable < ActiveRecord::Migration
  def change
  	rename_table :mails, :mailers
  end
end
