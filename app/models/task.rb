class Task < ActiveRecord::Base
  belongs_to :list
    
    default_scope { where(status: 'incomplete') }
    scope :complete, -> { where(status: 'complete') }
    scope :overdue, -> { where(status: 'overdue') }

  def days_remaining
      (self.created_at + 7.days) - (Time.now) 
  end

  def most_urgent
  #returns task closest to expiration
    list.tasks.sort_by.reverse! { |a,b| a.days_remaining <=> b.days_remaining }
  end


end
