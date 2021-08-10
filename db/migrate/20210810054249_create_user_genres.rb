class CreateUserGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :user_genres do |t|
      t.integer :user_id,  null: false
      t.integer :genre_id, null: false
      t.timestamps
    end
  end
end
