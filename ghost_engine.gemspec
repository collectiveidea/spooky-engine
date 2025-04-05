require_relative "lib/ghost_engine/version"

Gem::Specification.new do |spec|
  spec.name = "ghost_engine"
  spec.version = GhostEngine::VERSION
  spec.authors = ["Daniel Morrison"]
  spec.email = ["daniel@collectiveidea.com"]
  spec.homepage = "https://github.com/collectiveidea/ghost_engine"
  spec.summary = "A drop-in engine to put a Ghost blog into Rails."
  spec.description = "A drop-in engine to put a Ghost blog into Rails."
  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/collectiveidea/ghost_engine"
  spec.metadata["changelog_uri"] = "https://github.com/collectiveidea/ghost_engine/releases"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 8.0.1"
  spec.add_dependency "spooky"
end
