class Task < ActiveRecord::Base
  require 'active_support'
  belongs_to :list
    
    default_scope { where(status: 'incomplete') }
    scope :complete, -> { where(status: 'complete') }
    scope :overdue, -> { where(status: 'overdue') }

  def due_date
    t = self.created_at
    (t.day) + 6
  end

  def days_remaining
    n = Time.now
    day = n.day
    due_date - day
  end

  def most_urgent
  #returns task closest to expiration
    #list.tasks.sort_by.reverse! { |a,b| a.days_remaining <=> b.days_remaining }
    days_remaining < 8
  end

  def incomplete?
    self.status == "incomplete"
  end

end
