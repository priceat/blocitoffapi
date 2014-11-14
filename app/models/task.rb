class Task < ActiveRecord::Base
  require 'active_support'
  belongs_to :list
    



  def due_date
    t = self.created_at
    (t.day) + 7
  end

  def days_remaining
    n = Time.now
    day = n.day
    due_date - day
  end

end
