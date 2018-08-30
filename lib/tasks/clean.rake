require "rake/clean"

puts "Cleaning tmp files, scratch files and backup files"
CLEAN.include "log/**"
CLEAN.include "tmp/cache/**"
CLEAN.include "tmp/pids/**"
CLEAN.exclude "tmp/cache/.gitkeep"
CLEAN.exclude "tmp/pids/.gitkeep"
puts "Done Cleaning!"
