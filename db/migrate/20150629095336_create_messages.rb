class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :message_type
      t.string :mail_from
      t.string :mail_to
      t.string :subject
      t.text :mail_html
      t.text :mail_txt
      t.string :sender_name
      t.integer :mail_status

      t.timestamps
    end
  end
end
