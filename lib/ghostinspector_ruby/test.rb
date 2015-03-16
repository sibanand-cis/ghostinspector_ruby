module GhostinspectorRuby
  require 'faraday'
  require 'json'
  require 'byebug'



  class Test

    attr_reader :code, :data
    def initialize(attributes)
      @code = attributes["code"]
      @data = attributes["data"]
    end

    def self.all
      response = Faraday.get("#{API_URL}/tests/?apiKey=#{API_KEY}")
      tests = JSON.parse(response.body)
      new(tests)
    end

    def self.find(test_id)
      response = Faraday.get("#{API_URL}/tests/#{test_id}/?apiKey=#{API_KEY}")
      test = JSON.parse(response.body)
      new(test)
    end

    def self.execute(test_id)
      response = Faraday.get("#{API_URL}/tests/#{test_id}/execute/?apiKey=#{API_KEY}")
      result = JSON.parse(response.body)
      new(result)
    end

    def self.get_results(test_id)
      response = Faraday.get("#{API_URL}/tests/#{test_id}/results/?apiKey=#{API_KEY}")
      result = JSON.parse(response.body)
      new(result)
    end
  end
end