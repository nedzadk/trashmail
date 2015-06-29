class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :message_type
      t.string :from
      t.string :to
      t.string :subject
      t.text :html
      t.text :txt
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
