desc "Run code quality checks: roodi"
task :checks => %i[roodi rubocop rails_best_practices]
