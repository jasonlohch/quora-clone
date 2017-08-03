#sessions C- new
get '/login' do
	erb :"sessions/login"
end

#sessions C- create
post "/login" do
	@user = User.find_by(email: params[:user][:email])
	if @user && @user.authenticate(params[:user][:password])
		p "logged in"
		session[:user_id] = @user.id
		redirect "/home"
	else
		p "Couldn't get in"
		erb :"static/index"
	end
end

# sessions D- delete
post "/logout" do
	session.destroy
	redirect "/"
end