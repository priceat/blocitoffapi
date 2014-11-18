class Task < ActiveRecord::Base
  #require 'active_support'
  belongs_to :list
    

  def due_date
    Date.today - (self.created_at.to_date)
  end

  def days_remaining
   (7 - due_date).to_i
  end

end
