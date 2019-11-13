class CreateOwnedTrends < ActiveRecord::Migration[6.0]
  def change
    create_table :owned_trends do |t|
      t.string :name
      t.string :url
      t.boolean :promoted_content
      t.string :query
      t.integer :initial_tweet_volume
      t.integer :current_tweet_volume
      t.integer :initial_rank
      t.integer :current_rank
      t.float :initial_valuation
      t.float :current_valuation
      t.float :change_percent_volume
      t.float :change_percent_valuation
      t.integer :quantity_trends_purchased
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
