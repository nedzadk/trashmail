class Message < ActiveRecord::Base
  attr_accessible :email_from, :html, :message_type, :message_status, :email_subject, :email_to, :email_text, :user_id
  belongs_to :user
end
