get '/' do
  erb :welcome
end

get '/login' do
  erb :'auth/login'
end

post '/login' do
end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
end

get '/signout' do
end

