class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.string :email_from
      t.string :email_to
      t.string :email_subject
      t.text :email_html
      t.text :email_text
      t.string :sender_name      
      t.integer :message_type
      t.integer :message_status
      t.timestamps
    end
  end
end
