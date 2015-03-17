module GhostinspectorRuby
  require 'faraday'
  require 'json'

  class Suite
    attr_reader :code, :data
    def initialize(key)
      @api_key = key
    end

    def all
      response = Faraday.get("#{API_URL}/suites/?apiKey=#{@api_key}")
      suites = JSON.parse(response.body)
      code, data = suites['code'],suites['data']
    end

    def find(suite_id)
      response = Faraday.get("#{API_URL}/suites/#{suite_id}/?apiKey=#{@api_key}")
      suite = JSON.parse(response.body)
      code, data = suite['code'],suite['data']
    end

    def execute(suite_id)
      response = Faraday.get("#{API_URL}/suites/#{suite_id}/execute/?apiKey=#{@api_key}")
      execute_suite = JSON.parse(response.body)
      code, data = execute_suite['code'],execute_suite['data']
    end

    def tests(suite_id)
      response = Faraday.get("#{API_URL}/suites/#{suite_id}/tests/?apiKey=#{@api_key}")
      test_lists = JSON.parse(response.body)
      code, data = test_lists['code'],test_lists['data']
    end
  end

end