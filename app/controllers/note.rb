get '/notes/all' do
  @notes = current_user.notes
  erb :'notes/index'
end

get '/notes/new' do
  erb :'notes/new'
end

post '/notes' do
  if current_user
    Note.create(content: params[:content])
  else
    redirect '/login'
  end
  redirect '/'
end