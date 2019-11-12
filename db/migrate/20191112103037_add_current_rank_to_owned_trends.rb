class AddCurrentRankToOwnedTrends < ActiveRecord::Migration[6.0]
  def change
    add_column :owned_trends, :current_rank, :integer
  end
end
