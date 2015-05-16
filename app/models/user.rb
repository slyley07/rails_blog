class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
	
	has_many :active_relationships, class_name: "Relationship",
	                          foreign_key: :follower_id, 
	                          dependent: :destroy
	has_many :passive_relationships, class_name: "Relationship",
	                           foreign_key: :followed_id, 
	                           dependent: :destroy
	has_many :following, through: :active_relationships,  source: :followed # User.first.following
	has_many :followers, through: :passive_relationships, source: :follower # User.first.followers
	
	validates_uniqueness_of :username, :email, :case_sensitive => false
	validates_presence_of :username, :email, :password
	validates :username, format: {with: /\A\w+\z/, message: "only allows letters, numbers, and underscores"}

	def self.find_by_email(email)
		User.where("lower(email) = ?", email.downcase).first
	end

	def self.find_by_username(username)
		User.where("lower(username) = ?", username.downcase).first
	end

end
