class AddNewColumnToOwnedTrends < ActiveRecord::Migration[6.0]
  def change
    add_column :owned_trends, :initial_rank, :integer
  end
end
