require './test/test_helper'

class GhostInspectorResultTest < Minitest::Test

  def test_exists_results
    assert GhostinspectorRuby::Result
  end
end