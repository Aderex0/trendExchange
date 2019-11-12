class CreateOwnedTrends < ActiveRecord::Migration[6.0]
  def change
    create_table :owned_trends do |t|
      t.string :name
      t.string :url
      t.boolean :promoted_content
      t.string :query
      t.string :tweet_volume
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
