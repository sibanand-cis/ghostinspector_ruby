require './test/test_helper'

class GhostInspectorSuiteTest < Minitest::Test

  def test_exists
    assert GhostinspectorRuby::Suite
  end

  def test_gives_back_a_single_suite
    VCR.use_cassette('get_suite') do
      suite = GhostinspectorRuby::Suite.find('53e1c9c761e12aaa4dabf341')
      assert_equal GhostinspectorRuby::Suite, suite.class

      # Check that the fields are accessible by our model
      assert_equal 'SUCCESS', suite.code
      assert_equal '53e1c9c761e12aaa4dabf341', suite.data['_id']
      assert_equal "Test Suite", suite.data['name']
      assert_equal '547fc38c404e81ff79292e84', suite.data['organization']['_id']
      assert_equal "P J", suite.data['organization']['name']

    end
  end


  def test_gives_back_all_suites
    VCR.use_cassette('all_suites') do
      result = GhostinspectorRuby::Suite.all
      assert_equal 1, result.data.length
      assert result.data.kind_of?(Array)
      assert result.kind_of?(GhostinspectorRuby::Suite)
    end
  end



  def test_execute_the_suite
    VCR.use_cassette('execute_suite') do
      execute_suite = GhostinspectorRuby::Suite.execute('53e1c9c761e12aaa4dabf341')
      assert_equal GhostinspectorRuby::Suite, execute_suite.class

      assert_equal 'SUCCESS', execute_suite.code
      assert_equal true, execute_suite.data[0]['passing']
    end
  end

=begin
Suites – List Tests
https://api.ghostinspector.com/v1/suites/[suite-id]/tests/?apiKey=[api-key]
Response details : https://ghostinspector.com/api/#suites-tests
=end

  def test_list_of_tests_of_suite
    VCR.use_cassette('all_suite_tests') do
      suite_tests = GhostinspectorRuby::Suite.get_suite_tests('53e1c9c761e12aaa4dabf341')

      assert_equal 'SUCCESS', suite_tests.code
      assert_equal true, suite_tests.data[0]['passing']
    end
  end
end