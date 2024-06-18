class Stock < ApplicationRecord
  has_many :user_stocks
has_many :users, through: :user_stocks

validates :name , :ticker, presence: true
    def self.new_lookup(ticker_symbol)
        finnhub_client = FinnhubRuby::DefaultApi.new
        begin
          profile = finnhub_client.company_profile2({symbol: ticker_symbol})
          quote = finnhub_client.quote(ticker_symbol)
          new(
            ticker: ticker_symbol.upcase,
            name: profile.name,
            last_price: quote.c
          )
        rescue => exception
           
          Rails.logger.error "Error fetching data for ticker #{ticker_symbol}: #{exception.message}"
          return nil
        end
      end

      def self.check_db(ticker_symbol)
        where(ticker: ticker_symbol).first
      end
end
