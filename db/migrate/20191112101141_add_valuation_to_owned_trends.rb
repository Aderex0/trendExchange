class AddValuationToOwnedTrends < ActiveRecord::Migration[6.0]
  def change
    add_column :owned_trends, :valuation, :float
  end
end
