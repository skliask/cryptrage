class OneStepJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Pair.with_rate.all.each do |pair|
      related_pairs = Pair.with_rate.where(base: pair.quote, quote: pair.base).where.not(id: pair.id)

      related_pairs.each do |related_pair|
        margin = Margin.where(base: pair, quote: related_pair).first_or_create
        percentage = (((1/related_pair.rate) - pair.rate) / pair.rate ) * 100.0
        if percentage.to_s != "Infinity"
          margin.margin = percentage.round(4)
          margin.save
          ActionCable.server.broadcast("margin_channel",{id: margin.id, rate: percentage})
        end
      end
    end
  end
end
