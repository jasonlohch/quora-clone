class CreateAnswers < ActiveRecord::Migration[5.1]
	def change		
		create_table :answers do |t|
      		t.integer :question_id, index: true
      		t.integer :user_id, index: true
      		t.string :answer_description
      		t.integer :upvote, :default => 0
			t.integer :downvote, :default => 0
      		t.timestamps

		end
	end
end
