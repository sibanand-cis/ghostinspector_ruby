module GhostinspectorRuby
  require 'faraday'
  require 'json'
  require 'byebug'



  class Test

    def initialize(key,webhook_path)
      @api_key = key
      @webhook_url = webhook_path
    end

    def all
      response = Faraday.get("#{API_URL}/tests/?apiKey=#{@api_key}")
      tests = JSON.parse(response.body)
      code, data = tests['code'],tests['data']
    end

    def find(test_id)
      response = Faraday.get("#{API_URL}/tests/#{test_id}/?apiKey=#{@api_key}")
      test = JSON.parse(response.body)
      code, data = test['code'],test['data']
    end

    def execute(test_id)
      response = Faraday.get("#{API_URL}/tests/#{test_id}/execute/?apiKey=#{@api_key}&webhook=#{@webhook_url}")
      result = JSON.parse(response.body)
      code, data = result['code'],result['data']
    end

    def results(test_id)
      response = Faraday.get("#{API_URL}/tests/#{test_id}/results/?apiKey=#{@api_key}")
      result = JSON.parse(response.body)
      code, data = result['code'],result['data']
    end
  end
end