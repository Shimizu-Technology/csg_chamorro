# frozen_string_literal: true

require_relative "lib/csg_chamorro/version"

Gem::Specification.new do |spec|
  spec.name          = "csg_chamorro"
  spec.version       = CSGChamorro::VERSION
  spec.authors       = ["Code School of Guam"]
  spec.email         = ["codeschoolofguam@gmail.com"]

  spec.summary       = "Learn Chamorro words with your Ruby projects"
  spec.description   = "A gem that provides Chamorro words of the day with pronunciations, usage, and examples. Built by Code School of Guam students to preserve and share the Chamorro language!"
  spec.homepage      = "https://github.com/CSG-Live-July-2025/csg_chamorro"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 3.0"

  # Which files to include in the gem
  spec.files         = Dir.glob("lib/**/*") + ["README.md", "LICENSE.txt", "Rakefile", "csg_chamorro.gemspec", "bin/csg_chamorro"]
  
  # Where the main code lives
  spec.require_paths = ["lib"]
  
  # CLI setup
  spec.bindir        = "bin"
  spec.executables   = ["csg_chamorro"]
  
  # Dependencies (json comes with Ruby)
  spec.add_dependency "json"
end

