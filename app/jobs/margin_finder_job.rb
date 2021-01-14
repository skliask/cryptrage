class MarginFinderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Pair.with_rate.all.each do |pair|
      related_pairs = Pair.with_rate.where(base: pair.base, quote: pair.quote).where.not(id: pair.id)

      if related_pairs.any?
        related_pairs.each do |related_pair|
          margin = Margin.where(base: pair, quote: related_pair).first_or_create do |m|
            percentage = ((pair.rate - related_pair.rate)/related_pair.rate)*100
            m.margin = percentage
          end

          # todo broadcast
        end
      end
    end

    MarginFinderJob.set(wait: 2.minutes).perform_later
  end
end
