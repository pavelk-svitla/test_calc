# coding: utf-8
$LOAD_PATH << File.expand_path("../calc", __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "calc"
  spec.version       = 1.0
  spec.authors       = ["Pavel"]
  spec.email         = ["p.klimenkov@svitla.com"]
  spec.description   = %q{a gem to implement calculator}
  spec.summary       = %q{a gem to implement calculator}
  spec.homepage      = ""

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["calc"]

  spec.add_dependency "bundler"
  spec.add_development_dependency "rspec"
end
