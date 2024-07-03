class StocksController < ApplicationController

  def quote
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        respond_to do |format|  
          #format.html { render 'users/my_portfolio' }   
          format.js { render partial: 'users/result_js' }
        end
        
      else
        flash[:alert] = "Please enter a valid symbol to search"
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = "Please enter a symbol to search"
      redirect_to my_portfolio_path
    end
  end

 
    def index
      finnhub_client = FinnhubRuby::DefaultApi.new
      stock_symbols = finnhub_client.stock_symbols('US').sample(10) # Take only the first 15 symbols
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
