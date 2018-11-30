begin
  require "roodi_task"
  RoodiTask.new config: "config/roodi.yml"
rescue LoadError
  desc "roodi rake task not available in production"
  task :roodi do
    abort "Roodi rake task is not available in the production environment"
  end
end
