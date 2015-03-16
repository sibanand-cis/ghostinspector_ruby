module GhostinspectorRuby
  require 'faraday'
  require 'json'

  class Result
    attr_reader :code, :data
    def initialize(attributes)
      @code = attributes["code"]
      @data = attributes["data"]
    end

  end
end