class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :password, presence: true
  # uniqueness checks to see if that email already exists
  # EMAIL_REGEX makes sure the email is in x@x.x form!
  validates :email_address, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX } 
  before_save do  
  	# before saving the new/edited entry, make sure the lowercase the email address!
  	self.email_address.downcase!
  end
  	
  
end
