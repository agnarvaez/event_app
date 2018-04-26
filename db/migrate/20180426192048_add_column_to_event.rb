class AddColumnToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :date, :datetime
    add_column :events, :duration, :integer
    add_column :events, :start_time, :datetime
    add_column :events, :end_time, :datetime
    add_column :events, :location, :string
  end
end
