get '/' do
  erb :welcome
end

get '/dashboard' do
  erb :dashboard
end

get '/login' do
  erb :'auth/login'
end

post '/login' do
  user = User.find_by(email: params[:user][:email])

  if user.try(:authenticate, params[:user][:password])
    session[:user_id] = user.id
    redirect '/dashboard'
  else
    redirect '/login'
  end
end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  user = User.new(params[:user])

  if user.save
    session[:user_id] = user.user_id
    redirect '/'
  else
    redirect '/signup'
  end
end

get '/signout' do
  session[:user_id] = nil
  redirect '/'
end

