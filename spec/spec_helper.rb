require 'rubygems'
require 'bundler/setup'

require 'bob' # and any other gems you need
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.hook_into :webmock
end

RSpec.configure do |c|
  c.filter_run_including focus: true
  c.run_all_when_everything_filtered = true
end
