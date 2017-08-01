class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.integer :client_id
      t.integer :date
      t.integer :num_of_hours
      t.string :status
    end
  end
end
