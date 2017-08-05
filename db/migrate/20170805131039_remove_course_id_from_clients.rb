class RemoveCourseIdFromClients < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :course_id, :integer
  end
end
