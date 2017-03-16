class AddAuthorToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :author, :string
  end
end
