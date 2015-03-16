module GhostinspectorRuby
  require 'faraday'
  require 'json'

  API_URL = "https://api.ghostinspector.com/v1/suites"
  API_KEY = '53fd998d6f9a86cca6208f6e1429c6421c9cd0c6'


  class Suite
    attr_reader :code, :data
    def initialize(attributes)
      @code = attributes["code"]
      @data = attributes["data"]
    end

    def self.find(suite_id)
      response = Faraday.get("#{API_URL}/#{suite_id}/?apiKey=#{API_KEY}")
      attributes = JSON.parse(response.body)
      new(attributes)
    end

    def self.all
      response = Faraday.get("#{API_URL}/?apiKey=#{API_KEY}")
      suites = JSON.parse(response.body)
      new(suites)
    end

    def self.execute(suite_id)
      response = Faraday.get("#{API_URL}/#{suite_id}/execute/?apiKey=#{API_KEY}")
      execute_response = JSON.parse(response.body)
      new(execute_response)
    end

    def self.get_suite_tests(suite_id)
       response = Faraday.get("#{API_URL}/#{suite_id}/tests/?apiKey=#{API_KEY}")
       test_lists = JSON.parse(response.body)
       new(test_lists)
    end
  end

end