Gem::Specification.new do |s|
  # Gem Release
  s.version = '1.0.0.rc.1'
  s.date    = '2013-11-15'

  # Gem Details
  s.name        = 'Bootcamp'
  s.description = 'Jasmine-style BDD testing written in Sass for Sass.'
  s.authors     = ['James Kyle']
  s.email       = ['me@thejameskyle.com']
  s.homepage    = ['http://tctcl.github.io/bootcamp']

  s.license     = 'MIT'

  # Sass Files
  s.files += Dir.glob('dist/**/*.scss')

  # Coffee Files
  s.files += Dir.glob('dist/**/*.coffee')

  # Gems Dependencies
  s.add_dependancy('sass', ['>= 3.2.0'])
end
