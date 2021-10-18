class CreateAdminContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_contacts do |t|
      t.integer :contact_id, null: false
      t.text :message,       null: false
      
      t.timestamps
    end
  end
end
