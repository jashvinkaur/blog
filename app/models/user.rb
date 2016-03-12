class User < ActiveRecord::Base

	validates :name, :email, :password,  :presence => true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :password ,:length => {:within => 8..10}
	validates :email, :uniqueness=>true

	has_many :posts
	has_many :comments

end
						 