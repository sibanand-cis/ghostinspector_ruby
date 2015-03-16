module GhostinspectorRuby
  require 'faraday'
  require 'json'

  class Suite
    attr_reader :code, :data
    def initialize(attributes)
      @code = attributes["code"]
      @data = attributes["data"]
    end

    def self.all
      response = Faraday.get("#{API_URL}/suites/?apiKey=#{API_KEY}")
      suites = JSON.parse(response.body)
      new(suites)
    end

    def self.find(suite_id)
      response = Faraday.get("#{API_URL}/suites/#{suite_id}/?apiKey=#{API_KEY}")
      attributes = JSON.parse(response.body)
      new(attributes)
    end

    def self.execute(suite_id)
      response = Faraday.get("#{API_URL}/suites/#{suite_id}/execute/?apiKey=#{API_KEY}")
      execute_response = JSON.parse(response.body)
      new(execute_response)
    end

    def self.get_suite_tests(suite_id)
       response = Faraday.get("#{API_URL}/suites/#{suite_id}/tests/?apiKey=#{API_KEY}")
       test_lists = JSON.parse(response.body)
       new(test_lists)
    end
  end

end