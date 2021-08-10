class CreateYoutubers < ActiveRecord::Migration[5.2]
  def change
    create_table :youtubers do |t|
      t.integer :user_id,    null: false
      t.string  :name,       null: false
      t.float   :evaluation, null: false
      t.text    :content,    null:false
      t.timestamps
    end
  end
end
