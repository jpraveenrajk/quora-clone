# View signup page
get "/users/new" do
  erb :"users/signup" 
end

# Create users 
post "/users" do
  user = User.new(params[:user])
    if user.save
		redirect "/"
	else
		@errors = user.errors.full_messages
		erb :"users/signup"
	end
end

# View user profile page
get "/users/:id" do
  erb :"users/profile"
end
