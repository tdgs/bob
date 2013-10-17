require 'rubygems'
require 'bundler/setup'

require 'bob' # and any other gems you need

RSpec.configure do |c|
  c.filter_run_including focus: true
  c.run_all_when_everything_filtered = true
end
