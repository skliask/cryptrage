class MarketsController < ApplicationController
  def index
    @markets = Market.includes(:pairs).all
  end
end
