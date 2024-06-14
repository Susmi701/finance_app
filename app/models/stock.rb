class Stock < ApplicationRecord

    def self.new_lookup(ticker_symbol)
        finnhub_client = FinnhubRuby::DefaultApi.new
        begin
          profile = finnhub_client.company_profile2({symbol: ticker_symbol})
          quote = finnhub_client.quote(ticker_symbol)
          new(
            ticker: ticker_symbol,
            name: profile.name,
            last_price: quote.c
          )
        rescue => exception
           
          Rails.logger.error "Error fetching data for ticker #{ticker_symbol}: #{exception.message}"
          return nil
        end
      end
end
