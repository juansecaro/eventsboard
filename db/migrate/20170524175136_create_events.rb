class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :venue
      t.string :location
      t.timestamps
    end
  end
end
