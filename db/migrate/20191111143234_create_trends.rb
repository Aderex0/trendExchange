class CreateTrends < ActiveRecord::Migration[6.0]
  def change
    create_table :trends do |t|
      t.string :name
      t.string :url
      t.string :query
      t.string :tweet_volume

      t.timestamps
    end
  end
end
