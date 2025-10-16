# frozen_string_literal: true

require "rake"

# Task: Print a random Chamorro word with details
desc "Print a random Chamorro word"
task :word do
  require_relative "lib/csg_chamorro"
  puts CSGChamorro.pretty
end

# Task: List all words with their English translations
desc "List all Chamorro words"
task :list do
  require_relative "lib/csg_chamorro"
  puts "\n📚 All Chamorro Words:\n"
  CSGChamorro.all_words.each_with_index do |word, i|
    puts "#{i + 1}. #{word[:chamorro]} - #{word[:english]}"
  end
  puts
end

# Task: Show the gem version
desc "Show gem version"
task :version do
  require_relative "lib/csg_chamorro/version"
  puts "CSGChamorro v#{CSGChamorro::VERSION}"
end

# Task: Run all tests
desc "Run tests"
task :test do
  ruby "test/csg_chamorro_test.rb"
end

