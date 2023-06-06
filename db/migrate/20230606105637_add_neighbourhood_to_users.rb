class AddNeighbourhoodToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :neighbourhood, :string
  end
end
