class User < ActiveRecord::Base
	validates_uniqueness_of :username
	validates_presence_of :username, :email, :password
	has_many :posts
	has_many :comments
end
