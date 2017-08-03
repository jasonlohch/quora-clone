post '/questions/:id/upvote' do
	@question = Question.find(params[:id])
	#questions/:question_id/questionsvotes/upvote 
	# @question = Question.find_by(...)
	# current_user.questionvotes ... 
	question_vote = QuestionVote.find_by(user_id: current_user.id, question_id: params[:id]) #params[:question_id]
		if !question_vote.nil?
			if question_vote.updown == true  ## need one more loop of logic, if upvote is true and downvote is false, cannot press downvote again until update is false
				question_vote.destroy
			else
				question_vote.updown == false
				question_vote.update(updown: true)
			end
		else
			@question_votes = QuestionVote.new(user_id: current_user.id, question_id: params[:id], updown: true)
			@question_votes.save
		end
	redirect "/questions/#{params[:id]}" #redirect to questions/"#{question.id}"
end

post '/questions/:id/downvote' do
	@question = Question.find(params[:id])
	question_vote = QuestionVote.find_by(user_id: current_user.id, question_id: params[:id])
		if !question_vote.nil? 
			if question_vote.updown == false
				question_vote.destroy
			else
				question_vote.updown == true
				question_vote.update(updown: false)
			end
		else
			@question_votes = QuestionVote.new(user_id: current_user.id, question_id: params[:id], updown: false)
			@question_votes.save
		end
	redirect "/questions/#{params[:id]}"
end