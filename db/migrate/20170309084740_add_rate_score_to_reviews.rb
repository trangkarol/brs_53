class AddRateScoreToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :rate_score, :integer
  end
end
