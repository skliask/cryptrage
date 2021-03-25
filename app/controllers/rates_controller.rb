class RatesController < ApplicationController
  def index
    @markets = Market.includes(:pairs).all
  end
end
