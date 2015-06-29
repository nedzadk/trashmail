class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :full_name
      t.string :email

      t.timestamps
    end
    add_index :profiles, :email, :unique => true
  end
end
