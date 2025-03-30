require_relative "lib/quick_blog/version"

Gem::Specification.new do |spec|
  spec.name        = "quick_blog"
  spec.version     = QuickBlog::VERSION
  spec.authors     = [ "Daniel Morrison" ]
  spec.email       = [ "daniel@collectiveidea.com" ]
  spec.homepage    = "https://github.com/collectiveidea/quick_blog"
  spec.summary     = "A drop-in blog engine for Rails."
  spec.description = "A drop-in blog engine for Rails."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/collectiveidea/quick_blog"
  spec.metadata["changelog_uri"] = "https://github.com/collectiveidea/quick_blog/releases"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 8.0.1"
end
