guard :rspec do
  # specs
  watch(%r{^spec/(.+)_spec.rb$})
  # code
  watch(%r{^lib/(.+)/(.+)\.rb$}) { |m| puts m.inspect; "spec/#{m[1]}/#{m[2]}_spec.rb" }
  watch(%r{^lib/([^/]+)\.rb$})   { |m| puts m.inspect; "spec/#{m[1]}_spec.rb" }
end
