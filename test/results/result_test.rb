require './test/test_helper'

class GhostInspectorResultTest < Minitest::Test

  def test_exists_results
    assert GhostinspectorRuby::Result
  end

  def test_gives_back_a_single_result
    VCR.use_cassette('get_result') do
      result = GhostinspectorRuby::Result.find('5502f1e706454d3c06f33380')

      assert_equal 'SUCCESS', result.code
    end
  end
end