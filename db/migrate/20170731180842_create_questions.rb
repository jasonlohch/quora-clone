class CreateQuestions < ActiveRecord::Migration[5.1]
	def change
		create_table :questions do |t|
      		t.string :question_description
      		t.integer :user_id, index: true
			t.integer :upvote, :default => 0
			t.integer :downvote, :default => 0

			t.timestamps
		end
	end
end
