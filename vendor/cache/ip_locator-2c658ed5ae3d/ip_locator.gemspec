# -*- encoding: utf-8 -*-
# stub: ip_locator 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ip_locator"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "TODO: Set to 'http://mygemserver.com'" } if s.respond_to? :metadata=
  s.require_paths = ["lib"]
  s.authors = ["Jed Luhmann"]
  s.bindir = "exe"
  s.date = "2015-12-07"
  s.description = "Gem to wrap geoip API. The API returns location data derived from an ip address."
  s.email = ["jedluhmann@yahoo.com.com"]
  s.files = ["CODE_OF_CONDUCT.md", "Gemfile", "Gemfile.lock", "LICENSE.txt", "README.md", "Rakefile", "bin/console", "bin/setup", "ip_locator.gemspec", "lib/.DS_Store", "lib/ip_locator.rb", "lib/ip_locator/client.rb", "lib/ip_locator/configurable.rb", "lib/ip_locator/default.rb", "lib/ip_locator/version.rb"]
  s.homepage = "TODO: Put your gem's website or public repo URL here."
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.0"
  s.summary = "Gem to wrap geoip API. The API returns location data derived from an ip address."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.10"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<dotenv>, [">= 0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_runtime_dependency(%q<faraday>, [">= 0"])
      s.add_runtime_dependency(%q<faraday_middleware>, [">= 0"])
      s.add_runtime_dependency(%q<hashie>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.10"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<dotenv>, [">= 0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<faraday>, [">= 0"])
      s.add_dependency(%q<faraday_middleware>, [">= 0"])
      s.add_dependency(%q<hashie>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.10"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<dotenv>, [">= 0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<faraday>, [">= 0"])
    s.add_dependency(%q<faraday_middleware>, [">= 0"])
    s.add_dependency(%q<hashie>, [">= 0"])
  end
end
