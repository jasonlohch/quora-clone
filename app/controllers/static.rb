
get '/' do
	p session
  erb :"static/index"
end


get '/home' do
	@questions = Question.all.order(updated_at: :desc)
	erb :"static/home"
end


