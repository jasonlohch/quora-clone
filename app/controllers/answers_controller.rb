post '/questions/:id/answers' do
	@answer = current_user.answers.new(question_id: params[:id], answer_description: params[:answer])
	@answer.save
	redirect "/questions/#{params[:id]}"
end

get '/answers/:id/edit_answer' do
	@answer = Answer.find(params[:id])
	erb :"questions/edit_answer"
end

post '/answers/:id/edit_answer' do
	@answer = Answer.find(params[:id])
	@answer.update(params[:answer])
	@answer.save
	redirect "/questions/#{@answer.question.id}"
end

get '/answers/:id/delete_answer' do
	@answer = Answer.find(params[:id])
	erb :"questions/delete_answer"
end

delete '/answers/:id' do
	@answer = Answer.find(params[:id])
	@answer.destroy
	redirect '/questions/view'
end