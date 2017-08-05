class CreateClientCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :client_courses do |t|
      t.integer :client_id
      t.integer :course_id
    end
  end
end
