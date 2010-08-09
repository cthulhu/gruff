Gem::Specification.new do |s|
  s.name = %q{gruff}
  s.version = "0.3.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Geoffrey Grosenbach"]
  s.date = %q{2009-01-14}
  s.description = %q{Beautiful graphs for one or multiple datasets. Can be used on websites or in documents.}
  s.email = %q{boss@topfunky.com}
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "MIT-LICENSE", "Manifest.txt", "README.txt", "Rakefile" + "init.rb"] + 
    Dir['assets/**/*.png'] + Dir[ "lib/**/*.rb" ] + Dir[ "rails_generators/**/*.rb"] +
    Dir['test/**/*.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://nubyonrails.com/pages/gruff}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{gruff}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Beautiful graphs for one or multiple datasets.}
  s.test_files = Dir["test/**/*.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 1.8.2"])
    else
      s.add_dependency(%q<hoe>, [">= 1.8.2"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.8.2"])
  end
end
