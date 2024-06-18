class StocksController < ApplicationController

  # def search
  #   keyword=params[:query] || 'MSFT'
  #   search_result = FINNHUB_CLIENT.symbol_search(keyword)
  #   render json: search_result
  # end

  # def stock_symbols
  #   market = params[:market] || 'US'
  #   @results = FINNHUB_CLIENT.stock_symbols(market)
  # end
  def quote
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        render 'users/my_portfolio'
      else
        flash[:alert] = "Please enter a valid symbol to search"
        redirect_to my_portfolio_path
      end    
    else
      flash[:alert] = "Please enter a symbol to search"
      redirect_to my_portfolio_path
    end
  end
    
end
