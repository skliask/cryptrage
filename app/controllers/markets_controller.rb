class MarketsController < ApplicationController
  before_action :set_market, only: [:edit, :upadte, :destroy]
  def index
    @markets = Market.all.page(params[:page]).per(20)
  end

  def new
    @market = Market.new
  end

  def edit
  end

  def create
    @market = Market.new(market_params)

    if @market.save
      redirect_to markets_path
    else
      render :new
    end
  end

  def update

  end

  def destroy
  end

  private

  def market_params
    params.require(:market).permit(:name, :slug)
  end
end
