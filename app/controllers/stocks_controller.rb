class StocksController < ApplicationController

  def search
    keyword=params[:query] || 'MSFT'
    search_result = FINNHUB_CLIENT.symbol_search(keyword)
    render json: search_result
  end

  def stock_symbols
    market = params[:market] || 'US'
    @results = FINNHUB_CLIENT.stock_symbols(market)
  end
  def quote
    @forex_rates = FINNHUB_CLIENT.quote('MSFT')
      render plain:  @forex_rates
    end
end
