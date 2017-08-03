class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answers, dependent: :destroy
	has_many :question_votes
	# This is Sinatra! Remember to create a migration!
end
