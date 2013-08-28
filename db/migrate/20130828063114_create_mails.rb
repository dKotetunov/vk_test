class CreateMails < ActiveRecord::Migration
  def change
    create_table :mails do |t|
      t.string :to
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
