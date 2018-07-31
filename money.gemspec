$:.unshift(File.dirname(__FILE__) + '/lib/')
require 'money/version'

Gem::Specification.new do |s|
  s.name = 'money'
  s.version = Money::VERSION
  s.author = 'Sozoev Nurbek'
  s.homepage = 'https://github.com/sozoev/Money'
  s.platform = Gem::Platform::RUBY
  s.summary = ''
  s.require_path = 'lib'
  s.has_rdoc = false
  s.extra_rdoc_files = ['README.md']
  s.add_development_dependency('rspec', '~> 3.5')
  s.add_development_dependency('rake')

  s.files = %w(
    README.md
    Rakefile
  ) + Dir['lib/**/*.rb']

  s.test_files = Dir['spec/*.rb']
end
