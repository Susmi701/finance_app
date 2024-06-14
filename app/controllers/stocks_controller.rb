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
        respond_to do |format|
        format.js { render partial: 'users/result' }
      end 
      
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid symbol to search"
          format.js { render partial: 'users/result' }
        end
      end    
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a symbol to search"
        format.js { render partial: 'users/result' }
      end
    end
  end
    
end
