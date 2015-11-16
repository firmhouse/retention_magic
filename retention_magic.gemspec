$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "retention_magic/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "retention_magic"
  s.version     = RetentionMagic::VERSION
  s.authors     = ["Michiel Sikkes"]
  s.email       = ["michiel@firmhouse.com"]
  s.homepage    = "https://github.com/firmhouse/retention_magic"
  s.summary     = "Analyze cohorts and generate retention graphs for your app."
  s.description = <<-EOF
    RetentionMagic is a drop-in gem for instantly generating insightful graphs
    that tell you how your app users are activating and how your app's
    retention and churn is.
  EOF
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2"
  s.add_dependency "bootstrap-sass", "~> 3.3"
  s.add_dependency "chartkick", "~> 1.4"

  s.add_development_dependency "sqlite3", "~> 1.3"
end
