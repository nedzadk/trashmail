class Profile < ActiveRecord::Base
  attr_accessible :email, :full_name, :user_id
  belongs_to :user
end
