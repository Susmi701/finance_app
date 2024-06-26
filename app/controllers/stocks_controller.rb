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
    
end
