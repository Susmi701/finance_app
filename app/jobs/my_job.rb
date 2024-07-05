class MyJob < ApplicationJob
  queue_as :default

  def perform
    Stock.all.each do |stock|
      latest_price = fetch_latest_price(stock.ticker)
      stock.update(last_price: latest_price)
      
    end
  end

  private

  def fetch_latest_price(symbol)
    # Here you would make an HTTP request to a stock price API.
    # This is a simplified example using a placeholder value.
    # Replace with actual API request logic.
    finnhub_client = FinnhubRuby::DefaultApi.new
    quote = finnhub_client.quote(symbol)
    quote.c
  end 
end
