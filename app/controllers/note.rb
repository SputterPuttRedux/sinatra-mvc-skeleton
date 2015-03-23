
get '/notes/all' do
  @user = User.find(session[:user_id])
  @notes = @user.notes
  erb :'notes/index'
end

get '/notes/new' do
  erb :'notes/new'
end

post '/notes' do
  if current_user
    Note.create(content: params[:content])
  else
    flash[:notice] = "You have to be logged in to do that "
    redirect '/login'
  end
  redirect '/'
end


put '/notes/:id' do |id|
  note = Note.find(id)
  note.update(content: params[:note][:content])
  redirect "/notes/#{note.id}"
end

get '/notes/:id' do |id|
  @note = Note.find(id)
  erb :'/notes/show'
end


get '/notes/:id/edit' do |id|
  @note = Note.find(id)
  erb :'/notes/edit'
end

get '/notes/:id/delete' do |id|
  @note = Note.find(id)
  erb :'notes/delete'
end

delete '/notes/:id' do |id|
  @note = Note.find(id).destroy
  redirect '/notes/all'
end