desc "Run code quality checks: roodi"
task :checks => [:roodi, :rubocop]
