class CreateLikeActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :like_activities do |t|
      t.references :user, foreign_key: true
      t.integer :target_id
      t.string :target_type
      t.boolean :is_like

      t.timestamps
    end
  end
end
