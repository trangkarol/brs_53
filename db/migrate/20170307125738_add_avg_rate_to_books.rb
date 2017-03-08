class AddAvgRateToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :avg_rate, :float
  end
end
