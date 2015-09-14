class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :topic_id
      t.integer :reply_to

      t.timestamps null: false
    end
  end
end
