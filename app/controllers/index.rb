enable :sessions

get '/' do
  erb :index
end

post '/login' do
  user = User.authenticate(params[:email], params[:password])
  if user.nil?
    redirect to("/")
  else
    session[:user] = user
    redirect to('/secret_page')
  end
end

get '/secret_page' do
  erb :secret
end

post '/sign_up' do
  user = User.create_user(params[:name], params[:email], params[:password])
  puts "#{user}"
  if user == nil
    redirect to('/')
  else
    session[:user] = user
    redirect to('/secret_page')
  end
end

get '/password' do
  session[:user].password
end

get '/logout' do
  session.clear
  redirect to("/")
end


