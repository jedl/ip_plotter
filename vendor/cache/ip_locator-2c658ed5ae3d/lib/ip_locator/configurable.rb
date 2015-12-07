module IpLocator
  module Configurable
    # @!attribute api_endpoint
    #   @return [String] Base URL for API requests. default: http://api.db-ip.com/
    # @!attribute api_key
    #   @return [String] Client api_key
    # @!attribute connection_options
    #   @see https://github.com/lostisland/faraday
    #   @return [Hash] Configure connection options for Faraday
    #   @return [String] Configure preferred media type
    # @!attribute user_agent
    #   @return [String] Configure User-Agent header for requests.

    attr_accessor :api_endpoint, :api_key, :connection_options, :media_type, :user_agent

    class << self

      # List of configurable keys for {IpLocator::Client}
      # @return [Array] of option keys
      def keys
        @keys ||= [
          :api_endpoint,
          :api_key,
          :connection_options,
          :media_type,
          :user_agent
        ]
      end
    end

    # Set configuration options using a block
    def configure
      yield self
    end

    # Reset configuration options to default values
    def reset!
      IpLocator::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", IpLocator::Default.options[key])
      end
      self
    end
    alias setup reset!

    def api_endpoint
      File.join(@api_endpoint, "")
    end

    private

    def options
      Hash[IpLocator::Configurable.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end

  end

end
