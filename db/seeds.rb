# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

markets_json = JSON.parse Faraday.get("https://api.coingecko.com/api/v3/exchanges/list").body

markets_json.each do |market|
  wanted_markets = [
    "binance",
    "gdax",
    "kraken",
    "binance_us",
    "crypto_com",
    "gemini",
    "huobi",
    "okex",
    "bitfinex",
    "kucoin",
    "ftx_spot",
    "bitstamp",
    "gate",
    "bibox",
    "bithumb_global",
    "bittrex",
    "bitso",
    "nice_hash",
    "bitforex",
    "coinbene",
    "digifinex",
    "zb",
    "bithumb",
    "bitcoin_com",
    "changelly",
    "biki",
    "bitget",
    "bitrue",
    "coinsbit",
    "hoo",
    "whitebit",
    "bigone",
    "bitmart",
    "bitflyer",
    "latoken",
    "hotbit",
    "bitmax",
    "bitkub",
    "indodax",
    "max_maicoin",
    "vcc",
    "bitoffer",
    "upbit",
    "bkex",
    "mxc",
    "cointiger",
    "omgfin",
    "coinone",
    "btcturk",
    "paribu"
  ]
  if wanted_markets.include?(market["id"])
    Market.create(slug: market["id"], name: market["name"])
  end
end
