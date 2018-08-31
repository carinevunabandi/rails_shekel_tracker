begin
  require "rubocop/rake_task"

  RuboCop::RakeTask.new
rescue LoadError
  task :rubocop do
    abort "Rubocop rake task is not available (you're probably in a production environment)"
  end
end
