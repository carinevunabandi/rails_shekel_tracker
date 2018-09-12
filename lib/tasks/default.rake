ENV["RAILS_ENV"] ||= "test"
Rake::Task[:default].prerequisites.clear if Rake::Task.task_defined? :default

task :default => %i[
  clean
  checks
  spec
  bake:coverage:check_specs
]
# spec
# bake:coverage:check_specs
# cucumber
# cucumber:wip
# stats
# notes
# success
