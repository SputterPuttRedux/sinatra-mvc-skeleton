
get '/notes/all' do
  @user = User.find(session[:user_id])
  @notes = @user.notes.sort_by{ |note| note.updated_at }.reverse
  erb :'notes/index', locals: {notes: @notes}
end

get '/notes/new' do
  erb :'notes/new'
end

get '/notes/sort/false' do
  @user = User.find(session[:user_id])
  @notes = @user.notes.select{ |note| note.complete == false}
  erb :'notes/index'
end

get '/notes/sort/true' do
  @user = User.find(session[:user_id])
  @notes = @user.notes.select{ |note| note.complete == true}
  erb :'notes/index'
end

get '/nav' do
  erb :layout
end

post '/notes' do
  if session[:user_id]
    Note.create(content: params[:content], user_id: params[:note][:user_id])
  else
    flash[:notice] = "You have to be logged in to do that "
    redirect '/login'
  end
  redirect '/'
end

put '/notes/:id' do |id|
  note = Note.find(id)
  note.update(
    content: params[:note][:content],
    complete: params[:note][:complete]
    )
  redirect '/'
end

# put '/notes/:id/complete' do |id|
#   note = Note.find(id)
#   # note.update(complete: params[:note][:complete])
#   # flash[:notice] = "The status of this note has changed to #{note.complete}"
#   note.change_completion_status
#   redirect '/'
# end

get '/notes/:id/complete' do |id|
  note = Note.find(id)
  note.change_completion_status
  redirect '/'
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
  redirect '/'
end
