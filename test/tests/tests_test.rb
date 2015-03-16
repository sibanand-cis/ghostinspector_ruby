require './test/test_helper'

class GhostInspectorTestsTest < Minitest::Test

  def test_exists
    assert GhostinspectorRuby::Test
  end

  def test_gives_back_all_tests
    VCR.use_cassette('all_tests') do
      tests = GhostinspectorRuby::Test.all

      assert_equal 1, tests.data.length
      assert tests.data.kind_of?(Array)
      assert tests.kind_of?(GhostinspectorRuby::Test)
    end
  end

  def test_gives_back_a_single_test
    VCR.use_cassette('get_test') do
      test = GhostinspectorRuby::Test.find('54aa1af73f9fcf332dda7b06')

      assert_equal 'SUCCESS', test.code
      assert_equal 'Click Consent',test.data['name']
    end
  end

  def test_execute_the_test
    VCR.use_cassette('execute_test') do
      execute_test = GhostinspectorRuby::Test.execute('54aa1af73f9fcf332dda7b06')
      assert_equal GhostinspectorRuby::Test, execute_test.class

      assert_equal 'SUCCESS', execute_test.code
      assert_equal true, execute_test.data['passing']
    end
  end

  def test_list_of_results_of_a_test
    VCR.use_cassette('list_of_results_of_a_test') do
      result_list = GhostinspectorRuby::Test.get_results('54aa1af73f9fcf332dda7b06')

      assert_equal 'SUCCESS', result_list.code
    end
  end
end