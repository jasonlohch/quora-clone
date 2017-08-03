post '/answers/:id/upvote' do
	@answer = Answer.find(params[:id])
	answer_vote = AnswerVote.find_by(user_id: current_user.id, answer_id: params[:id])
		if !answer_vote.nil?
			if answer_vote.updown == true
				answer_vote.destroy
			else
				answer_vote.updown == false
				answer_vote.update(updown: true)
			end
		else
			@answer_votes = AnswerVote.new(user_id: current_user.id, answer_id: params[:id], updown: true)
			@answer_votes.save
		end
	redirect "/questions/#{@answer.question.id}"
end

post '/answers/:id/downvote' do
	@answer = Answer.find(params[:id])
	answer_vote = AnswerVote.find_by(user_id: current_user.id, answer_if: params[:id])
		if !answer_vote.nil?
			if answer_vote.updown == false
				answer_vote.destroy
			else
				answer_vote.updown == true
				answer_vote.update(updown: false)
			end
		else
			@answer_votes = AnswerVote.new(user_id: current_user.id, answer_id: params[:id], updown: false)
			@answer_votes.save
		end
	redirect "/questions/#{@answer.question.id}"
end