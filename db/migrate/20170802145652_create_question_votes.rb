class CreateQuestionVotes < ActiveRecord::Migration[5.1]
	def change
		create_table :question_votes do |t|
		  	t.integer :question_id, index: true       
	      	t.integer :user_id, index: true
	      	t.boolean :updown
	     end
	end
end
