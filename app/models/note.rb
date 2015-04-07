class Note < ActiveRecord::Base
  belongs_to :user

  def change_completion_status
    if self.complete
      self.update(complete: false)
    else
      self.update(complete: true)
    end
  end

end