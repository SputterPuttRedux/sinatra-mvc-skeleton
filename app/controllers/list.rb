get '/lists/new' do
  erb :'lists/new'
end

# All lists for a user
get '/lists/all' do
  @lists = current_user.lists
  erb :dashboard
end

get '/lists/:id' do |id|
  @list = current_user.lists.find(id)
  erb :'lists/show'
end

get '/lists/:id/edit' do |id|
  @list = current_user.lists.find(id)
  erb :'lists/edit', locals: {list: @list}
end

put '/lists/:id' do |id|
  list = List.find(id)
  list.update(params[:list])
  list.items.each{ |item| item.update(content: params[:content])}
  # list.items.each{|item| item.update(content: params[:content])}
  redirect "lists/#{list.id}"
end


post '/lists' do
  list = List.create(params[:list])
  params[:content].each{ |k,v| list.items.create(content: v) }
  redirect "/lists/#{list.id}"
end

delete 'lists/:id' do |id|
end