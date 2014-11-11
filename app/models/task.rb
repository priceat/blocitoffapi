class Task < ActiveRecord::Base
  belongs_to :list
    
    default_scope :incomplete, -> { where status: 'incomplete' }
    scope :complete, -> { where status: 'complete' }

end
