require_relative 'test_helper'

class GhostInspectorTest < Minitest::Test
  def test_ghostinspector
    assert GhostinspectorRuby::Client
  end

  def test_new_ghostinspector
    client = GhostinspectorRuby.new(:api_key => '53fd998d6f9a86cca6208f6e1429c6421c9cd0c6')
    assert_instance_of GhostinspectorRuby::Client, client

    assert_equal 'ghostinspector.com',client.options[:site]
    assert_includes client.options[:api_key], client.options[:api_key]
  end

  def test_ghostinspector_get
    client = GhostinspectorRuby.new(:api_key => '53fd998d6f9a86cca6208f6e1429c6421c9cd0c6')
    client.get('tests')
  end
end