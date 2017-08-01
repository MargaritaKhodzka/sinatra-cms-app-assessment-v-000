class ChangeDatatypeForDate < ActiveRecord::Migration[5.1]
  def change
    change_column :courses, :date, :datetime
  end
end
