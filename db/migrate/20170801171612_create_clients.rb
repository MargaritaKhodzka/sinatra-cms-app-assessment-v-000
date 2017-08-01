class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :full_name
      t.integer :age
      t.integer :course_id
      t.string :notes
    end
  end
end
