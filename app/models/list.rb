class List < ActiveRecord::Base
  require 'active_support'
  
  has_many :tasks, dependent: :destroy
  belongs_to :user

  default_scope { order('created_at DESC') }
end
