class AddSeatsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :seats, :integer, default: 0
  end
end
