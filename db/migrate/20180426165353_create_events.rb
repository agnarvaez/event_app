class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :date
      t.string :duration
      t.string :location
      t.timestamps
    end
  end
end
