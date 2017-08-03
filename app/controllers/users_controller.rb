#users - C - create
post '/signup' do
  @user = User.new(username: params[:user][:username], email: params[:user][:email], password: params[:user][:password])
  if @user.save
  	p "User Saved"
  	redirect "/login"
    # what should happen if the user is saved?
  else
  	@errors = @user.errors.full_messages.join(",")
  	erb :"static/index"
    # what should happen if the user keyed in invalid date?
  end

end  


# users - R -all

get '/users' do
	@users = User.all
	erb :"users/index"
end

# users - R - show
get '/users/:id' do
	@user = User.find(params[:id])
	erb :"users/show"
end

get '/users/:id/account_settings' do
	@user = User.find(params[:id])
	erb :"users/account_settings"
end

get '/users/:id/edit_username' do
	@user = User.find(params[:id])
	erb :"users/edit_username"
end

# users - U - edit username
post '/users/:id/edit_username' do
  @user = User.find(params[:id])
  if @user.update(params[:user])
  	erb :"users/account_settings"
    # what should happen if the user is saved?
  else
  	@errors = @user.errors.full_messages.join(",")
  	erb :"users/edit_username"
    # what should happen if the user keyed in invalid username?
  end

end 

get '/users/:id/edit_email' do
	@user = User.find(params[:id])
	erb :"users/edit_email"
end

# users - U - edit email
post '/users/:id/edit_email' do
  @user = User.find(params[:id])
  if @user.update(params[:user])
  	erb :"users/account_settings"
    # what should happen if the user is saved?
  else
  	@errors = @user.errors.full_messages.join(",")
  	erb :"users/edit_email"
    # what should happen if the user keyed in invalid email?
  end

end 

get '/users/:id/edit_password' do
	@user = User.find(params[:id])
	erb :"users/edit_password"
end

# users - U - edit password
post '/users/:id/edit_password' do
  @user = User.find(params[:id])
  if @user.authenticate(params[:old_password]) == @user #means old password keyed in is correct
  	if params[:new_password] == params[:user][:password]
  		if @user.update(params[:user])
  			erb :"users/account_settings"
  		end
  	end
    # what should happen if the user is saved?
  else
  	erb :"users/edit_password"
    # what should happen if the user keyed in invalid password?
  end

end 






# U? D?