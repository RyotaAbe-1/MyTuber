class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :genre_name,          null: false
      t.boolean :application_status, null: false, default: "false"
      t.timestamps
    end
  end
end
