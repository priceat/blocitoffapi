desc "updates tasks"
task update_tasks: :environment do
  tasks = Task.where("created_at <= ?", Time.now - 7.days)
  tasks.each { |t| t.update_column(:overdue, true) }
end

# works "automatically" with whenever gem (schedule.rb)
# :environment is a dependency (will be run first) that loads the 
# environment to have access to models, classes, etc.
# http://railscasts.com/episodes/66-custom-rake-tasks