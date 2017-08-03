post '/questions' do
		@question = current_user.questions.new(params["question"])
	 	@question.save 
		redirect '/home'
end

get '/questions/:id' do
	
	@question = Question.find(params[:id])
	
	@answers = Answer.where(question_id: params[:id])
	
	@voted_question = QuestionVote.find_by(user_id: current_user.id,question_id: @question.id) #means this fella upvoted before
	if @voted_question && @voted_question.updown == true
		@message = "You upvoted"
	elsif @voted_question && @voted_question.updown == false
		@message = "You downvoted"
	else
		@message = ""
	end


	erb :"questions/view"
end

get '/questions/:id/edit_question' do
	@question = Question.find(params[:id])
	erb :"questions/edit_question"
end

post '/questions/:id/edit_question' do
	@question = Question.find(params[:id])
	@question.update(params[:question])
	@question.save
	redirect '/home'
end

get '/questions/:id/delete_question' do
	@question = Question.find(params[:id])
	erb :"questions/delete_question"
end

delete '/questions/:id' do
	@question = Question.find(params[:id])
	@question.destroy
	redirect '/home'
end

