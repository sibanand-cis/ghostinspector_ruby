module GhostinspectorRuby
  require 'faraday'
  require 'json'

  class Result
    attr_reader :code, :data
    def initialize(attributes)
      @code = attributes["code"]
      @data = attributes["data"]
    end

    def self.find(result_id)
      response = Faraday.get("#{API_URL}/results/#{result_id}/?apiKey=#{API_KEY}")
      result = JSON.parse(response.body)
      new(result)
    end
  end
end