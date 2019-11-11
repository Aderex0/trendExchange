class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :name
      t.string :url
      t.boolean :promoted_content
      t.string :query
      t.string :tweet_volume

      t.timestamps
    end
  end
end
