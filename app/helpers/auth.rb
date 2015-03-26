def current_user
  if session[:user_id]
    return User.find(session[:user_id])
  else
    return nil
  end
end

def temp_username
  current_user.email.gsub(/@\w+.\w+/, "")
end

def note_timestamp(note)
  note.created_at == note.updated_at ? "Created at: #{note.created_at}" : "Updated at: #{note.updated_at}"
end

def num_notes_complete(notes)
  notes.select{ |note| note.complete == true }.count
end

def num_notes_incomplete(notes)
  notes.select{ |note| note.complete == false }.count
end