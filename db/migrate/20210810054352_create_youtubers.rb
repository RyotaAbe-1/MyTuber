class CreateYoutubers < ActiveRecord::Migration[5.2]
  def change
    create_table :youtubers do |t|

      t.timestamps
    end
  end
end
