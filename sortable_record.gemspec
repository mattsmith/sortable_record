# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sortable_record/version'

Gem::Specification.new do |gem|
  gem.name          = "sortable_record"
  gem.version       = SortableRecord::VERSION
  gem.authors       = ["Matt Smith"]
  gem.email         = ["matt@thinkific.com"]
  gem.description   = %q{Allows you to sort ActiveRecord models}
  gem.summary       = %q{Allows you to sort ActiveRecord models}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency "activesupport", "~> 3.2.15"
  gem.add_development_dependency "rspec"
end
