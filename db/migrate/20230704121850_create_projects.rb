class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :about
      t.string :successfailure
      t.string :lesson
      t.integer :user_id
      t.string :genre
      t.string :pdf

      t.timestamps
    end
  end
end
