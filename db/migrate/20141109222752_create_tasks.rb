class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :body
      t.references :list, index: true

      t.timestamps
    end
  end
end
