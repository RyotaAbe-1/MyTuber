class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :youtuber_id, null: false
      t.integer :user_id,     null: false
      t.text    :content,     null: false
      t.timestamps
    end
  end
end
