class StocksController < ApplicationController

  def quote
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      
      if @stock.present? && !@stock.last_price.zero?
        respond_to do |format|  
          format.js { render partial: 'stock_result_js' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid symbol to search"
          format.js { render partial: 'stock_result_js' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a symbol to search"
        format.js { render partial: 'stock_result_js' }
      end
      
    end
  end

 
  def index
    finnhub_client = FinnhubRuby::DefaultApi.new
    stock_symbols = finnhub_client.stock_symbols('US').sample(1)
    @stocks = stock_symbols.map do |symbol|
      quote = finnhub_client.quote(symbol.symbol)
      { ticker: symbol.symbol, price: quote}
    end
    @stockHistory=UserStock.where(user_id: current_user.id)
    @covid_stat = finnhub_client.covid19()
    @covid_stats = @covid_stat.each_with_object({}) do |covid_info, hash|
      hash[covid_info.state] = covid_info._case.to_i 
    end
    render 'welcome/index'
  end


end
