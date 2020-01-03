require 'bundler/setup'

require 'yard'

YARD::Rake::YardocTask.new(:doc) do |t|
end


require 'bundler/gem_tasks'

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task default: :test
