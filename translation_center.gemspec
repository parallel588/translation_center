$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "translation_center/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "translation_center"
  s.version     = TranslationCenter::VERSION
  s.authors     = ["afalkear"]
  s.email       = ["afalkear@gmail.com"]
  s.homepage    = "http://github.com/afalkear/translation_center"
  s.summary     = "Multi lingual web Translation Center community for Rails 4 apps"
  s.description = "Translation Center is a multi lingual web engine for Rails 4 apps. It builds a translation center community with translators and admins from your system users."
  s.license = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "jquery-rails"
  s.add_dependency 'haml'
  s.add_dependency 'haml-rails'
  s.add_dependency 'acts_as_votable'
  s.add_dependency 'ya2yaml'
  s.add_dependency 'font-awesome-rails'
  # s.add_dependency 'audited-activerecord'
  s.add_dependency 'jquery-ui-rails'

end
