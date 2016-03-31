# View user login page
get "/sessions/login" do
  erb :"users/login"
end

# Post user login details/Creating a new session
post "/sessions" do
  user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
  if user
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @message = "Error logging in. Please ensure email and password are correct."
    erb :"users/login"
  end
end

# Log out
get "/sessions/logout" do
  session[:user_id] = nil
  redirect '/'
end