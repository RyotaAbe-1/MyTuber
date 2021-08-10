class CreateYoutuberGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :youtuber_genres do |t|

      t.timestamps
    end
  end
end
