class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :user1_id
      t.string :user2_id_integer
      t.boolean :type

      t.timestamps
    end
  end
end
