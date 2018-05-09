class AddAvailableToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :available, :boolean, default: false
  end
end
