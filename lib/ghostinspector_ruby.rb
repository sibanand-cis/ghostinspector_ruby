require_relative "ghostinspector_ruby/version"
require_relative "ghostinspector_ruby/client"
require_relative "ghostinspector_ruby/suite"
require_relative "ghostinspector_ruby/test"
require_relative "ghostinspector_ruby/result"

module GhostinspectorRuby
  API_URL = 'https://api.ghostinspector.com/v1'

  def new(options={})
    @client ||= Client.new(options)
  end

  module_function :new
end

