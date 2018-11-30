begin
  task :rails_best_practices do
    puts "Running Rails best practices check..."
    system "rails_best_practices" or raise
  end
rescue LoadError
  task :rails_best_practices do
    abort "Rails best practices rake task is not available (you're probably in a production environment)"
  end
end
