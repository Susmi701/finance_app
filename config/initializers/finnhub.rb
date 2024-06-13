require 'finnhub_ruby'
FinnhubRuby.configure do |config|
  config.api_key['api_key'] =Rails.application.credentials.finnhub_ruby[:api_key]
end

FINNHUB_CLIENT = FinnhubRuby::DefaultApi.new
