class MarketsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "market_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
