class MarginsController < ApplicationController
  def index
    @margins = Margin.includes(base: [:base,:quote], quote: [:base,:quote]).where("margin > 0").order(margin: :desc).limit(100)
  end
end
