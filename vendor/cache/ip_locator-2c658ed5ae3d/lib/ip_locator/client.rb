require "faraday"
require "faraday_middleware"
# require "ip_locator/error"
require "ip_locator/configurable"

module IpLocator

  # Client for geoip service
  class Client

    include IpLocator::Configurable

    def initialize(options = {})
      IpLocator::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || IpLocator.instance_variable_get(:"@#{key}"))
      end
    end

    def connection
      @connection || init_connection
    end

    # Compares client options to a Hash of requested options
    # 
    # @param opts [Hash] Options to compare with current client options
    # @return [Boolean]
    def same_options?(opts)
      opts.hash == options.hash
    end

    def get(*args)
      request :get, *args
    end

    def post(*args)
      request :post, *args
    end

    # # Lookup location by ip addr using http://api.db-ip.com/
    # def lookup_address(ip_addr)
    #   response = get "addrinfo", {addr: ip_addr, api_key: api_key}
    #   response.body
    # end

    # Lookup location by ip add using http://freegeoip.net/
    def lookup_address(ip_addr)
      response = get "/#{media_type.sub("application/", "")}/#{ip_addr}"
      response.body
    end

    private

    def reset_connection
      @connection = nil
      @api_key = nil
    end

    def request(method, *args)
      response = connection.public_send(method, *args)
    end

    def init_connection
      @connection = Faraday.new(api_endpoint, connection_options) do |faraday|
        # faraday.request :multipart
        faraday.request :url_encoded

        # faraday.response :logger
        faraday.response :mashify
        faraday.response :json, :content_type => /\bjson$/
        faraday.response :raise_error
        faraday.adapter Faraday.default_adapter
      end
    end

  end
end
