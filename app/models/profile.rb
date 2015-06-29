class Profile < ActiveRecord::Base
  attr_accessible :email, :full_name, :user_id
  validates_uniqueness_of :email
  belongs_to :user
end
