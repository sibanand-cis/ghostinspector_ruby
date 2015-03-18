module GhostinspectorRuby
  class Client

    attr_accessor :options

    def initialize(options={})
      store_options(options)
      raise ArgumentError, "At least a client_id or an access_token must be present" if api_key.nil?
    end


    def api_key
      @options[:api_key]
    end

    def webhook_url
      @options[:webhook_url]
    end

    def api_host
      [API_SUBHOST, host].join('.')
    end

    def store_options(options={})
      @options = {}
      @options.merge!(options)
    end

# Method to find result by id
    def result id
      Result.new id,api_key
    end

# Methods for tests
    def test
      @test ||= Test.new api_key,webhook_url
    end
# Method for suite
    def suite
      Suite.new api_key
    end
  end
end