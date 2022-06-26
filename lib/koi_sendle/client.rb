require "Base64"
require "faraday"
require "faraday_middleware"

module KoiSendle
  class Client
    attr_reader :api_key, :api_secret, :adapter, :authorization

    def initialize(api_key:, api_secret:, adapter: Faraday.default_adapter, sandbox: false, stubs: nil)
      @api_key = api_key
      @adapter = adapter

      @base_uri = sandbox ? "https://sandbox.sendle.com/api" : "https://api.sendle.com/api"
      @api_key = api_key
      @api_secret = api_secret
      @adapter = adapter

      # Test stubs for requests
      @stubs = stubs
    end

    def ping
      PingResource.new(self)
    end

    def quotes
      QuoteResource.new(self)
    end

    def products
      ProductResource.new(self)
    end

    def orders
      OrderResource.new(self)
    end

    def track
      TrackingResource.new(self)
    end

    def connection
      @connection ||= Faraday.new(@base_uri) do |conn|
        conn.request :basic_auth, @api_key, @api_secret
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.adapter adapter, @stubs
      end
    end
  end
end
