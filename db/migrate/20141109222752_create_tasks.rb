class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :body
      t.string :status, default: "incomplete"
      

      t.timestamps
    end
  end
end
