require './test/test_helper'

class GhostInspectorTestsTest < Minitest::Test

  def test_exists
    assert GhostinspectorRuby::Test
  end

  def test_gives_back_all_tests
    VCR.use_cassette('all_tests') do

    end
  end
end