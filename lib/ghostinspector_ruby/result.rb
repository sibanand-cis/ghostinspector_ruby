module GhostinspectorRuby
  require 'faraday'
  require 'json'

  class Result
    attr_reader :code, :data

    def initialize(id,key)
       @url = "/results/#{id}?apiKey=#{key}"
    end

    def api_url
      "#{API_URL}#{@url}"
    end

    def find
      response = Faraday.get(api_url)
      result = JSON.parse(response.body)
      code, data = result['code'],result['data']
    end
  end
end