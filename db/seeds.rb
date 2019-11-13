# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(username: 'User1', password: 'abcd', account_balance: 0)

OwnedTrend.create(name: 'Sonic', initial_tweet_volume: 200000, user_id: 1, initial_rank: 5, initial_valuation: 1.0, quantity_trends_purchased: 2)
OwnedTrend.create(name: 'Frank Dobson', initial_tweet_volume: nil, user_id: 1, initial_rank: 2, initial_valuation: 1.0, quantity_trends_purchased: 2)
