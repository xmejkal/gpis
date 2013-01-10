# -*- encoding: utf-8 -*-
require File.expand_path('../lib/gpis/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors   = ["Petr Smejkal"]
  gem.email     = ["xmejkal@gmail.com"]
  gem.date        = '2013-01-10'
  gem.summary     = "Google Play Application Info Scraper"
  gem.description = "A Simple gem to scrape information about android applications from the Google Play website. It has support for scraping info in multiple languages. For now only name, category and description are supported, as only these were needed by the programmer so far."
  gem.homepage  = "https://github.com/xmejkal/gpis"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "gpis"
  gem.require_paths = ["lib"]
  gem.version       = Gpis::VERSION

  gem.add_dependency "nokogiri"
end
