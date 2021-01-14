class MarginsController < ApplicationController
  def index
    @margins = Margin.includes(base: [:base,:quote], quote: [:base,:quote]).order(margin: :desc).limit(100)
  end
end
