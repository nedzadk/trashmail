class Message < ActiveRecord::Base
  attr_accessible :from, :html, :message_type, :name, :status, :subject, :to, :txt, :user_id
  belongs_to :user
end
