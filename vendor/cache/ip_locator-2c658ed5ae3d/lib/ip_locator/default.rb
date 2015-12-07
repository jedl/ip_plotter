module IpLocator
  class Default

    # Default API Endpoint
    API_ENDPOINT = 'http://freegeoip.net/'.freeze

    # Default User Agent
    USER_AGENT = "IpLocator #{IpLocator::VERSION}".freeze

    # Default Media Type
    MEDIA_TYPE = "application/json"

    class << self
      # Configuration options
      # @return [Hash]
      def options
        Hash[IpLocator::Configurable.keys.map{|key| [key, send(key)]}]
      end

      # Default API endpoint from ENV or {API_ENDPOINT}
      # @return [String]
      def api_endpoint
        ENV['IPLOCATOR_API_ENDPOINT'] || API_ENDPOINT
      end

      # Default API key from ENV
      # @return [String]
      def api_key
        ENV['IPLOCATOR_API_KEY']
      end

      # Default User-Agent header string from ENV or {USER_AGENT}
      # @return [String]
      def user_agent
        ENV['IPLOCATOR_USER_AGENT'] || USER_AGENT
      end

      # Default media type from ENV or {MEDIA_TYPE}
      # @return [String]
      def media_type
        ENV['IPLOCATOR_MEDIA_TYPE'] || MEDIA_TYPE
      end

      # Default options for Faraday::Connection
      # @return [Hash]
      def connection_options
        {
          :headers => {
            :accept => media_type,
            :user_agent => user_agent
          }
        }
      end
    end

  end
end
