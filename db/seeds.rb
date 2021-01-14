# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

markets_json = JSON.parse Faraday.get("https://api.coingecko.com/api/v3/exchanges/list").body

markets_json.each do |market|
  wanted_markets = ["kraken","binance","coinbase_pro","huobi","kucoin","bitfinex","bitstamp", "liquid", "poloniex", "okex"]

  if wanted_markets.include?(market["id"])
    Market.create(slug: market["id"], name: market["name"])
  end
end
