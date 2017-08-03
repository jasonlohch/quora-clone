class CreateAnswerVotes < ActiveRecord::Migration[5.1]
	def change
		create_table :answer_votes do |t|
		  	t.integer :answer_id, index: true       
	      	t.integer :user_id, index: true
	      	t.boolean :updown
	     end
	end
end
