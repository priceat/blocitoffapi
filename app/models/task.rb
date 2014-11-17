class Task < ActiveRecord::Base
  require 'active_support'
  belongs_to :list
    
def overdue
    case
    when task.overdue?
      task.to_i
    else
      0
    end
end



  def due_date
    t = self.created_at
    (t.day) + 6
  end

  def days_remaining
    n = Time.now
    day = n.day
    due_date - day
  end

end
