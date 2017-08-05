class RemoveClientIdFromCourses < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :client_id, :integer
  end
end
