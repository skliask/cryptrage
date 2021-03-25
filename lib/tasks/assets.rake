namespace :assets do
  desc "TODO"
  task seed_pairs: :environment do
    coingecko_coins = JSON.parse Faraday.get("https://api.coingecko.com/api/v3/coins/list").body
    tickers = {}
    Market.all.each do |market|
      sleep 0.5
      tickers[market.slug] = []
      results = []
      count = 100
      page = 1

      while count >= 100
        begin
          coingecko_tickers = JSON.parse Faraday.get("https://api.coingecko.com/api/v3/exchanges/#{market.slug}/tickers?page=#{page}").body
        rescue
          binding.pry
        end
        results << coingecko_tickers["tickers"]
        count = coingecko_tickers["tickers"].count
        page += 1
        sleep 0.5
      end

      results.flatten.each do |ticker|
        if !ticker["is_stale"] && !ticker["is_anomaly"]
          tickers[market.slug] << [ticker["base"], ticker["target"]]
        end
      end
    end

    tickers.values.flatten.uniq.each do |ticker|
      new_asset = coingecko_coins.select{|k| k["symbol"] == ticker.downcase}
      if !new_asset.empty?
        Asset.create(name: new_asset.first["name"], slug: new_asset.first["id"], ticker: ticker)
      end
    end

    tickers.each do |ticker|
      market = Market.find_by_slug(ticker.first)
      ticker.last.each do |pair|
        base = Asset.find_by_ticker pair.first
        target = Asset.find_by_ticker pair.last

        if base && target
          market.pairs.where(base:base, quote: target)
          .first_or_create(
            name: "#{base.ticker}/#{target.ticker}",
            slug: "#{base.ticker}_#{target.ticker}"
          )
        end
      end
    end
  end

  task set_prices: :environment do
    Market.all.each do |market|
      results = []
      count = 100
      page = 1
      while count >= 100
        tickers = JSON.parse Faraday.get("https://api.coingecko.com/api/v3/exchanges/#{market.slug}/tickers?page=#{page}").body
        results << tickers["tickers"]
        count = tickers["tickers"].count
        page += 1
      end

      results.flatten.each do |ticker|
        base = Asset.find_by_ticker(ticker["base"])
        quote = Asset.find_by_ticker(ticker["target"])
        pair = market.pairs.where(base: base, quote: quote).first

        if pair
          pair.update_column(:rate, ticker["last"].to_d )
        end
      end
    end
  end
end
