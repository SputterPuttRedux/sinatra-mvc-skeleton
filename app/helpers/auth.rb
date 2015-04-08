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

def date_display(date)
  date.strftime('%b %-d, %Y, %l:%M:%S %P')
end

def note_timestamp(note)
  note.created_at == note.updated_at ? "Created on: #{date_display(note.created_at)}" : "Updated on: #{date_display(note.updated_at)}"
end

def num_notes_complete(notes)
  notes.select{ |note| note.complete == true }.count
end

def num_notes_incomplete(notes)
  notes.select{ |note| note.complete == false }.count
end

def make_first_note
  Note.create(user_id: session[:user_id], content: "Welcome to Note Keeper! Create your first note!")
end

def first_note
  Note.find_by(content: "Welcome to Note Keeper! Create your first note!")
end

def complete_first_note
  first_note.update(content: "Congrats on making your first note!", complete: true)
end
