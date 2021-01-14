class PairValueUpdaterJob < ApplicationJob
  sidekiq_options retry: 0
  queue_as :default

  def perform(*args)
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
          value = ticker["last"].to_d
          pair.update_column(:rate, value )
          ActionCable.server.broadcast("market_channel",{id: pair.id,rate: value})
        end
      end
    end
    PairValueUpdaterJob.set(wait: 2.minutes).perform_later
  end
end
