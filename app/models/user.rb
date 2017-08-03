class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_secure_password #method inside gem bcrypt that allows user to encrypt 
						#the password given, and able to autehnticate it automatically
	has_many :questions
	has_many :answers

	validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
	validates :username, uniqueness: true, presence: true
end

