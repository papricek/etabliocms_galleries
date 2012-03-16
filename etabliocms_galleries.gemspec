$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "etabliocms_galleries/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.name = "etabliocms_galleries"
  gem.version = EtabliocmsGalleries::VERSION
  gem.authors = ["papricek"]
  gem.email = ["patrikjira@gmail.com"]
  gem.homepage = "https://github.com/papricek/etabliocms_galleries"
  gem.summary = "Small CMS - module for galleries"
  gem.description = "Small CMS - module for galleries"

  gem.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "README.textile"]
  gem.test_files = Dir["test/**/*"]

  gem.add_dependency "rails", "~> 3.2.1"
  gem.add_dependency "etabliocms_core"
  gem.add_dependency "paperclip"

  gem.add_development_dependency "sqlite3"
end
