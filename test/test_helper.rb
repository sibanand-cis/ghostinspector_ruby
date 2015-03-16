require './lib/ghostinspector_ruby'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'
require "minitest/reporters"
Minitest::Reporters.use!

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock
end